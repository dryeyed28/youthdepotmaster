package control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminService;
import vo.Admin;

public class AdminController implements YouthDepotController {
	private AdminService service = new AdminService();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		System.out.println("admin_id, admin_pwd 값은 : " + admin_id + "," + admin_pwd);
		
		HttpSession session = request.getSession();
		session.invalidate();
		try {
 		String loginResult = service.adminLogin(admin_id, admin_pwd);
 	
 		if(loginResult.equals("1")) {
 			//로그인 성공
 			session = request.getSession();
 			session.setAttribute("loginInfo", admin_id);
 		}
 			request.setAttribute("loginResult", loginResult);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
 		
		String forwardURL = "loginlistresult2.jsp";
		return forwardURL;
	}
	
	
}
;