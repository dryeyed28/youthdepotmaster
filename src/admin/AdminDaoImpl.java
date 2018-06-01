package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.AdminDAO;
import dao.AdminDAOOracle;
import sql.OracleConnection;
import vo.Admin;

public class AdminDaoImpl implements AdminDao {
		
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public String jdbc_driver;
	public String jdbc_url;
	public ResultSet rs = null;
	
	public AdminDaoImpl() {
		jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	}
	
	public void con() {
		try {
			Class.forName(jdbc_driver);
			con = DriverManager.getConnection(jdbc_url, "kitri", "kitri");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void discon() {
		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
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
