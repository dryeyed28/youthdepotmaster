package admin;

import vo.Admin;

public interface AdminService {
	public Admin adminLogin(String admin_id, String admin_pwd);
}
