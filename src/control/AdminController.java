package control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdminService;
import vo.Admin;

public class AdminController implements YouthDepotController {
	private AdminService service = new AdminService();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		
		try {
 		Admin admin = service.adminLogin(admin_id, admin_pwd);
 		
 		request.setAttribute("admin", admin);
 		
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
 		
		String forwardURL = "loginlistresult2.jsp";
		return forwardURL;
	}
	
	
}
;