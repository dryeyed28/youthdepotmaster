package post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.OracleConnection;
import vo.Board;
import vo.Post;

public class PostDaoOracle implements PostDao {

	@Override
	public ArrayList<Post> postList(int brd_id) {
		ArrayList<Post> data = new ArrayList<Post>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select rownum, p.brd_id, b.brd_name, p.mem_id, p.mem_nickname, p.admin_id, \n";
			sql += "p.POST_TITLE, p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT ,p.POST_DEL \n";
			sql += "from board b, post p \n";
			sql += "where b.brd_id = p.brd_id and p.post_del=0 and p.brd_id = 20 and rownum <= 10";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, brd_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Post post = new Post(rs.getInt("rownum"),
						new Board(rs.getInt("brd_id"),
								rs.getString("brd_name")),
						rs.getInt("mem_id"),
						rs.getString("mem_nickname"),
						rs.getString("admin_id"),
						rs.getString("post_title"),
						rs.getString("post_content"),
						rs.getString("post_datetime"),
						rs.getInt("post_view_count"),
						rs.getInt("post_del")
						);
				
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
	public Post postMenu(int post_id) {
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
			sql += "where post_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public void deletePost(int post_id) {
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
			if(commit == 1) {
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
	public void updatePost(Post post) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sql = "UPDATE post "
					+ "SET POST_TITLE = ?,POST_CONTENT = ? "
					+ "WHERE post_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,post.getPost_title());
			pstmt.setString(2, post.getPost_content());
			pstmt.setInt(3,post.getPost_id());
			int commit = pstmt.executeUpdate();
			if(commit == 1) {
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
	public void insertPost(Post post) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sqlinsert = "Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL) \r\n" + 
							   "values ((SELECT MAX(POST_ID)+1 from post),?,?,?,?,?,?,to_date(sysdate,'RR/MM/DD'),0,0)";
			pstmt = con.prepareStatement(sqlinsert);
			pstmt.setInt(1,post.getBoard_id().getBrd_id());
			pstmt.setInt(2,post.getMem_id());
			pstmt.setString(3,post.getAdmin_id());
			pstmt.setString(4,post.getMem_nickName());
			pstmt.setString(5,post.getPost_title());
			pstmt.setString(6,post.getPost_content());
			int commit = pstmt.executeUpdate();
			if(commit == 1) {
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
	public int selectCount(int brd_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			con = OracleConnection.getConnection();
			String selectCountSQL = "SELECT count(*) totalcnt " 
					+ "FROM post "
					+ "WHERE brd_id = ?";
			pstmt = con.prepareStatement(selectCountSQL);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		} return 0;
	}


}
