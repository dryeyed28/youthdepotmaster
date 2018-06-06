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
					"select * \r\n" + 
					"FROM \r\n" + 
					"(select rownum r, p.brd_id, b.brd_name, b.brd_type, p.mem_id, p.mem_nickname, p.admin_id, \r\n" + 
					"p.POST_TITLE, p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT ,p.POST_DEL, p.post_file \r\n" + 
					"from board b, post p \r\n" + 
					"where b.brd_id = p.brd_id and p.post_del=0 and p.brd_id = ? \r\n" + 
					"order by rownum desc) \r\n" + 
					"WHERE r>=? and r<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, brd_id);
			pstmt.setInt(2, (realPage-1)*10+1);
			pstmt.setInt(3, realPage*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post(rs.getInt(1),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), rs.getString("admin_id"), rs.getString("mem_nickname"),
						rs.getString("post_title"), rs.getString("post_content"), rs.getString("post_datetime"),
						rs.getInt("post_view_count"), rs.getInt("post_del"), rs.getString("post_file"));
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
	public Post postMenu(int brd_id, int post_id) { // 게시글 상세보기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select post_id, mem_id, mem_nickname, admin_id, \n";
			sql += "POST_TITLE, POST_CONTENT, TO_CHAR(POST_DATETIME, 'yyyy.mm.dd') post_datetime, POST_VIEW_COUNT \n";
			sql += "from post \n";
			sql += "where brd_id = ? and post_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, brd_id);
			pstmt.setInt(2, post_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				post.setPost_id(Integer.parseInt(rs.getString(1)));
				post.setMem_id(Integer.parseInt(rs.getString(2)));
				post.setMem_nickName(rs.getString(3));
				post.setAdmin_id(rs.getString(4));
				post.setPost_title(rs.getString(5));
				post.setPost_content(rs.getString(6));
				post.setPost_dateTime(rs.getString(7));
				post.setPost_view_count(Integer.parseInt(rs.getString(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return post;
	}

	@Override
	public void deletePost(int post_id) { // 게시글 삭제
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
	public void updatePost(Post post) { // 게시글 수정하기
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			/* con.setAutoCommit(false); */
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
	public void insertPost(Post post) { // 게시글 작성하기
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sqlinsert = "Insert into POST (POST_ID,BRD_ID,ADMIN_ID,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE)"
					+ "values ((SELECT MAX(POST_ID)+1 from post),20,?,?,?,to_date(sysdate,'RR/MM/DD'),0,0,?)";
			System.out.println(post);
			pstmt = con.prepareStatement(sqlinsert);
			//pstmt.setInt(1, post.getBoard_id().getBrd_id());
			// pstmt.setInt(2, post.getMem_id());
			pstmt.setString(1, post.getAdmin_id());
			// pstmt.setString(4, post.getMem_nickName());
			pstmt.setString(2, post.getPost_title());
			pstmt.setString(3, post.getPost_content());
			pstmt.setString(4, post.getPost_file());
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
	public int selectCount(int brd_id) { // 게시판에서 게시글 수 확인
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String selectCountSQL = "SELECT count(*) totalcnt " + "FROM post " + "WHERE brd_id = ?";
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
	public ArrayList<Post> searchAll(String mem_nickname, String post_title, String post_content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> list = new ArrayList<Post>();
		try {
			con = OracleConnection.getConnection();
			String searchAll = "select rownum, p.*, b.brd_name, b.brd_type\r\n" + "from post p\r\n" + "join board b\r\n"
					+ "on p.brd_id = b.brd_id \r\n"
					+ "and mem_nickname like ? or post_title like ? or post_content like ?\r\n" + "and rownum <=10";
			pstmt = con.prepareStatement(searchAll);
			pstmt.setString(1, "%" + mem_nickname + "%");
			pstmt.setString(2, "%" + post_title + "%");
			pstmt.setString(3, "%" + post_content + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), rs.getString("admin_id"), rs.getString("mem_nickname"),
						rs.getString("post_title"), rs.getString("post_content"), rs.getString("post_datetime"),
						rs.getInt("post_view_count"), rs.getInt("post_del"), rs.getString("post_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Post> searchTitle(String post_title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> list = new ArrayList<Post>();
		String searchTitle = "select rownum, p.*, b.brd_name, b.brd_type\r\n" + "from post p\r\n" + "join board b\r\n"
				+ "on p.brd_id = b.brd_id \r\n" + "and post_title like ?\r\n" + "and rownum <=10";

		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(searchTitle);
			pstmt.setString(1, "%" + post_title + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), rs.getString("admin_id"), rs.getString("mem_nickname"),
						rs.getString("post_title"), rs.getString("post_content"), rs.getString("post_datetime"),
						rs.getInt("post_view_count"), rs.getInt("post_del"), rs.getString("post_file")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Post> searchWriter(String mem_nickname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> list = new ArrayList<Post>();

		String searchWriter = "select rownum, p.*, b.brd_name, b.brd_type\r\n" + "from post p\r\n" + "join board b\r\n"
				+ "on p.brd_id = b.brd_id \r\n" + "and mem_nickname like ?\r\n" + "and rownum <=10";
		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(searchWriter);
			pstmt.setString(1, "%" + mem_nickname + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), rs.getString("admin_id"), rs.getString("mem_nickname"),
						rs.getString("post_title"), rs.getString("post_content"), rs.getString("post_datetime"),
						rs.getInt("post_view_count"), rs.getInt("post_del"), rs.getString("post_file")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Post> searchContent(String post_content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> list = new ArrayList<Post>();

		String searchContent = "select rownum, p.*, b.brd_name, b.brd_type\r\n" + "from post p\r\n" + "join board b\r\n"
				+ "on p.brd_id = b.brd_id \r\n" + "and post_content like ?\r\n" + "and rownum <=10";
		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(searchContent);
			pstmt.setString(1, "%" + post_content + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(rs.getInt("post_id"),
						new Board(rs.getInt("brd_id"), rs.getString("brd_name"), rs.getString("brd_type"), 0),
						rs.getInt("mem_id"), rs.getString("admin_id"), rs.getString("mem_nickname"),
						rs.getString("post_title"), rs.getString("post_content"), rs.getString("post_datetime"),
						rs.getInt("post_view_count"), rs.getInt("post_del"), rs.getString("post_file")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

}
