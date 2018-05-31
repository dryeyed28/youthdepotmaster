package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sql.OracleConnection;
import vo.Admin;

public class AdminDAOOracle implements AdminDAO {
	
	@Override
	public int adminLogin(String admin_id, String admin_pwd) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = OracleConnection.getConnection();
			String adminLogin = "select *\r\n" + 
					"from admin\r\n" + 
					"where admin_id=? and admin_pwd=?";
			Admin admin = new Admin();
			pstmt = con.prepareStatement(adminLogin);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_pwd);
			rs = pstmt.executeQuery();
			if(!rs.next()) { //어드민계정이 없는 경우
				return -1; //로그인 불가
			} else {
				return 1; //로그인 성공
			}
		} catch(SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
	}
	
	public static void main(String[] args) {
		AdminDAOOracle dao = new AdminDAOOracle();
		String admin_id = "admin";
		String admin_pwd = "admin";
		int admin;
		try {
			admin = dao.adminLogin(admin_id, admin_pwd);
			System.out.println(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
