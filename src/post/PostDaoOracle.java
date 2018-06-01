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
			sql += "select p.post_id, p.brd_id, b.brd_name, p.mem_id, p.mem_nickname, p.admin_id, \n";
			sql += "p.POST_TITLE, p.POST_CONTENT, TO_CHAR(p.POST_DATETIME, 'yyyy.mm.dd') post_datetime, p.POST_VIEW_COUNT ,p.POST_DEL \n";
			sql += "from board b, post p \n";
			sql += "where b.brd_id = p.brd_id and p.post_del=0 and p.brd_id = 20";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, brd_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Post post = new Post(rs.getInt("post_id"),
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
			pstmt.executeUpdate();
			if(pstmt.executeUpdate() == 1) {
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

}
