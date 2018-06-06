package admin;

import vo.Admin;

public class AdminServiceImpl implements AdminService {
	
	private AdminDao dao;
	
	public AdminServiceImpl() {
		dao = new AdminDaoOracle();
	}
		
	@Override
	public Admin adminLogin(String admin_id, String admin_pwd) {
		return dao.adminLogin(admin_id, admin_pwd);
	}

}
