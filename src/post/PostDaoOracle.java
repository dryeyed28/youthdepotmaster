package post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.OracleConnection;
import vo.Board;
import vo.Post;

public class PostDaoOracle implements PostDao {

	@Override
	public ArrayList<Post> postList(int brd_id, int realPage) {
		ArrayList<Post> data = new ArrayList<Post>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = 
					"select b.* from\r\n" + 
					"(select rownum r,a.*\r\n" + 
					"FROM (select p.post_id, p.brd_id, b.brd_name, b.brd_type, p.mem_id,  p.admin_id, p.mem_nickname,\r\n" + 
					"p.POST_TITLE, p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT ,p.POST_DEL, p.post_file\r\n" + 
					"from board b, post p \r\n" + 
					"where b.brd_id = p.brd_id and p.post_del=0 and p.brd_id = ?\r\n" + 
					"order by post_id desc)a)b\r\n" + 
					"where r between ? and ?";
			pstmt = con.prepareStatement(sql);
			int cntPerPage = 10;
			int endRow=cntPerPage * realPage;
			int startRow=endRow-cntPerPage+1; 
			pstmt.setInt(1, brd_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post(
						rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"),
						rs.getString("admin_id"),
						rs.getString("mem_nickname"),
						rs.getString("post_title"), 
						rs.getString("post_content"), 
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"), 
						rs.getInt("post_del"),
						rs.getString("post_file"));
				data.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return data;
	}

	@Override
	public Post postMenu(int brd_id, int post_id) { //게시글 상세보기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select p.post_id, p.mem_id, p.mem_nickname, p.admin_id, p.POST_TITLE, \n";
			sql += "p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT, b.brd_type \n";
			sql += "from post p, board b \n";
			sql += "where p.brd_id = b.brd_id and p.brd_id = ? and p.post_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, brd_id);
			pstmt.setInt(2, post_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString(1) != null)
					post.setPost_id(Integer.parseInt(rs.getString(1)));
				if (rs.getString(2) != null)				
					post.setMem_id(Integer.parseInt(rs.getString(2)));
				post.setMem_nickName(rs.getString(3));
				post.setAdmin_id(rs.getString(4));
				post.setPost_title(rs.getString(5));
				post.setPost_content(rs.getString(6));
				post.setPost_dateTime(rs.getString(7));
				post.setPost_view_count(Integer.parseInt(rs.getString(8)));
				post.setBoard_id(new Board(brd_id, null, rs.getString("brd_type"), 0));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		System.out.println("post~~~~~ : " +post);
		return post;
	}

	@Override
	public void deletePost(int post_id) { //게시글 삭제
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sql = "";
			sql += "UPDATE post \n";
			sql += "SET post_del = ? \n";
			sql += "WHERE post_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, post_id);
			int commit = pstmt.executeUpdate();
			if (commit == 1) {
				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(pstmt, con);
		}
	}

	@Override
	public void updatePost(Post post) { //게시글 수정하기
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			/*con.setAutoCommit(false);*/
			String sql = "UPDATE post " + "SET POST_TITLE = ?,POST_CONTENT = ? " + "WHERE post_id = ?"
					+ "AND brd_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post.getPost_title());
			pstmt.setString(2, post.getPost_content());
			pstmt.setInt(3, post.getPost_id());
			pstmt.setInt(4, post.getBoard_id().getBrd_id());
			int commit = pstmt.executeUpdate();
			if (commit == 1) {
				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(pstmt, con);
		}
	}

	@Override
	public void insertPost(Post post) { //게시글 작성하기
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sqlinsert = "Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE)"
					+ "values ((SELECT MAX(POST_ID)+1 from post),?,?,?,?,?,?,to_date(sysdate,'RR/MM/DD'),0,0,?)";
			System.out.println(post);
			pstmt = con.prepareStatement(sqlinsert);
			pstmt.setInt(1, (post.getBoard_id().getBrd_id()));
			pstmt.setInt(2, post.getMem_id());
			pstmt.setString(3, "admin");
			pstmt.setString(4, post.getMem_nickName());
			pstmt.setString(5, post.getPost_title());
			pstmt.setString(6, post.getPost_content());
			pstmt.setString(7, post.getPost_file());
			int commit = pstmt.executeUpdate();
			if (commit == 1) {
				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(pstmt, con);
		}

	}

	@Override
	public int selectCount(int brd_id) { //게시판에서 게시글 수 확인
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String selectCountSQL = 
					"SELECT count(*) totalcnt " + "FROM post " + "WHERE brd_id = ? and post_del=0 ";
			pstmt = con.prepareStatement(selectCountSQL);
			pstmt.setInt(1, brd_id);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return 0;
	}

	@Override
	public ArrayList<Post> searchAll(int brd_id, String mem_nickName, String post_title, String post_content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> list = new ArrayList<Post>();
		try {
			con = OracleConnection.getConnection();
			String searchAll = "select a.*\r\n" + 
					"from \r\n" + 
					"(select rownum, p.*, b.brd_name, b.brd_type \r\n" + 
					"from post p\r\n" + 
					"join board b\r\n" + 
					"on p.brd_id = b.brd_id\r\n" + 
					"where b.brd_id = ?) a\r\n" + 
					"where mem_nickname like ? or post_title like ? or post_content like ?\r\n" + 
					"and rownum <=10";
			pstmt = con.prepareStatement(searchAll);
			pstmt.setInt(1, brd_id);
			pstmt.setString(2, "%" + mem_nickName + "%");
			pstmt.setString(3, "%" + post_title + "%");
			pstmt.setString(4, "%" + post_content + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(
						rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"),
						rs.getString("admin_id"), 
						rs.getString("mem_nickname"),
						rs.getString("post_title"), 
						rs.getString("post_content"), 
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"), 
						rs.getInt("post_del"),
						rs.getString("post_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}
	
	@Override
	public ArrayList<Post> searchTitle(int brd_id, String post_title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Post> list = new ArrayList<Post>();
		String searchTitle = "select a.*\r\n" + 
				"from \r\n" + 
				"(select p.*, b.brd_name, b.brd_type \r\n" + 
				"from post p\r\n" + 
				"join board b\r\n" + 
				"on p.brd_id = b.brd_id\r\n" + 
				"where b.brd_id = ?\r\n" + 
				"and rownum <=10) a\r\n" + 
				"where post_title like ?";
		
		try {
		con = OracleConnection.getConnection();
		pstmt = con.prepareStatement(searchTitle);
		pstmt.setInt(1, brd_id);
		pstmt.setString(2, "%" + post_title + "%");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			list.add(new Post(
					rs.getInt("post_id"),
					new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
					rs.getInt("mem_id"), 
					rs.getString("admin_id"), 
					rs.getString("mem_nickname"),
					rs.getString("post_title"), 
					rs.getString("post_content"), 
					rs.getString("post_datetime"),
					rs.getInt("post_view_count"), 
					rs.getInt("post_del"),
					rs.getString("post_file")));
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Post> searchWriter(int brd_id, String mem_nickname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Post> list = new ArrayList<Post>();
		
		String searchWriter = "select a.*\r\n" + 
				"from \r\n" + 
				"(select rownum, p.*, b.brd_name, b.brd_type \r\n" + 
				"from post p\r\n" + 
				"join board b\r\n" + 
				"on p.brd_id = b.brd_id\r\n" + 
				"where b.brd_id = ?) a\r\n" + 
				"where mem_nickname like ?" + 
				"and rownum <=10";
		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(searchWriter);
			pstmt.setInt(1,  brd_id);
			pstmt.setString(2, "%" + mem_nickname + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Post(
						rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), 
						rs.getString("admin_id"), 
						rs.getString("mem_nickname"),
						rs.getString("post_title"), 
						rs.getString("post_content"), 
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"), 
						rs.getInt("post_del"),
						rs.getString("post_file")));
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				OracleConnection.close(rs, pstmt, con);
			}
			return list;
	}

	@Override
	public ArrayList<Post> searchContent(int brd_id, String post_content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Post> list = new ArrayList<Post>();
		
		String searchContent = "select a.*\r\n" + 
				"from \r\n" + 
				"(select p.*, b.brd_name, b.brd_type \r\n" + 
				"from post p\r\n" + 
				"join board b\r\n" + 
				"on p.brd_id = b.brd_id\r\n" + 
				"where b.brd_id = ?\r\n" + 
				"and rownum <=10) a\r\n" + 
				"where  post_content like ?";
		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(searchContent);
			pstmt.setInt(1, brd_id);
			pstmt.setString(2, "%" + post_content + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Post(
						rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), 
						rs.getString("admin_id"), 
						rs.getString("mem_nickname"),
						rs.getString("post_title"), 	
						rs.getString("post_content"), 
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"), 
						rs.getInt("post_del"),
						rs.getString("post_file")));
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				OracleConnection.close(rs, pstmt, con);
			}
			return list;
	}

	@Override
	public ArrayList<Post> getPostList(int brd_id) {
		ArrayList<Post> data = new ArrayList<Post>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = 
					"select * \r\n" + 
							"FROM \r\n" + 
							"(select rownum r, p.post_id, p.brd_id, b.brd_name, b.brd_type, p.mem_id, p.mem_nickname, p.admin_id, \r\n" + 
							"p.POST_TITLE, p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT ,p.POST_DEL, p.post_file \r\n" + 
							"from board b, post p \r\n" + 
							"where b.brd_id = p.brd_id and p.post_del=0 and p.brd_id = ? \r\n" + 
							"order by rownum desc) \r\n";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, brd_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post(
						rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"),
						rs.getString("admin_id"),
						rs.getString("mem_nickname"),
						rs.getString("post_title"), 
						rs.getString("post_content"), 
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"), 
						rs.getInt("post_del"),
						rs.getString("post_file"));
				data.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return data;
	}
	
	public static void main(String[] args) {
		PostDao dao = new PostDaoOracle();
		int brd_id = 20;
		String mem_nickName = "다들";
		String post_title = "다들";
		String post_content = "다들";
		ArrayList<Post> list = new ArrayList<>();
		list = dao.searchAll(brd_id, mem_nickName, post_title, post_content);
		System.out.println("list 값은 : " + list);	
	}
}
