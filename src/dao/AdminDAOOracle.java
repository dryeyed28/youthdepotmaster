package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sql.OracleConnection;
import vo.Admin;

public class AdminDAOOracle implements AdminDAO {
			
	@Override
	public String adminLogin(String admin_id, String admin_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String loginResult = "";
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
				loginResult = "-1"; //로그인 불가
			} else {
				loginResult = "1"; //로그인 성공
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return loginResult;
	}
	
	public static void main(String[] args) {
		AdminDAOOracle dao = new AdminDAOOracle();
		String admin_id = "admin";
		String admin_pwd = "admin";
		String result;
		try {
			result = dao.adminLogin(admin_id, admin_pwd);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
