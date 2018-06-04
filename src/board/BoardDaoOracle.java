package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.OracleConnection;
import vo.Board;

public class BoardDaoOracle implements BoardDao {
	
	@Override
	public ArrayList<Board> boardList() {
		ArrayList<Board> list = new ArrayList<Board>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "select b.brd_id, b.brd_name, b.brd_type, count(p.post_id) \n" + 
					"from board b join post p on b.brd_id = p.brd_id \n" + 
					"where p.post_del=0 \n" + 
					"group by b.brd_id, b.brd_name, b.brd_type \n" + 
					"order by b.brd_id";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBrd_id(rs.getInt(1));
				board.setBrd_name(rs.getString(2));
				board.setBrd_type(rs.getString(3));
				board.setBrd_count(rs.getInt(4));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	/*@Override
	public ArrayList<Board> boardList() {
		ArrayList<Board> list = new ArrayList<Board>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "select brd_id, brd_name \n"
					+ "from board \n"
					+ "order by brd_id";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBrd_id(rs.getInt("brd_id"));
				board.setBrd_name(rs.getString("brd_name"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}*/

}
