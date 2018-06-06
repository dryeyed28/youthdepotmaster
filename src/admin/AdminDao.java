package admin;

import vo.Admin;

public interface AdminDao {
	
	public Admin adminLogin(String admin_id, String admin_pwd);
}
