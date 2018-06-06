package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import admin.AdminDao;
import admin.AdminDaoOracle;
import sql.OracleConnection;
import vo.Admin;

public class AdminDaoOracle implements AdminDao {
		
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public String jdbc_driver;
	public String jdbc_url;
	public ResultSet rs = null;
	
	public AdminDaoOracle() {
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
	public Admin adminLogin(String admin_id, String admin_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
				return null;
			} else {
				Admin admin = new Admin(
						rs.getString("admin_id"),
						rs.getString("admin_name"),
						rs.getString("admin_pwd")
						);
				return admin;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return null;
	}
}
