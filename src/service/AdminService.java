package service;

import dao.AdminDAO;
import dao.AdminDAOOracle;
import vo.Admin;

public class AdminService {
	private AdminDAO dao = new AdminDAOOracle();
	
	public Admin adminLogin(String admin_id, String admin_pwd) throws Exception{
		return dao.adminLogin(admin_id, admin_pwd);
	}
}
