package admin;

public class AdminServiceImpl implements AdminService {
	
	private AdminDao dao;
	
	public AdminServiceImpl() {
		dao = new AdminDaoOracle();
	}
		
	@Override
	public String adminLogin(String admin_id, String admin_pwd) {
		return dao.adminLogin(admin_id, admin_pwd);
	}

}
