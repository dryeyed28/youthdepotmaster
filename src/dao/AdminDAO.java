package dao;

import vo.Admin;

public interface AdminDAO {
	public int adminLogin(String admin_id, String admin_pwd) throws Exception;
}
