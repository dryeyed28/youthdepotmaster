package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Admin;

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String type = "";
		String result = "";
		String loginResult = "";
		AdminService service = new AdminServiceImpl();
		Admin admin = null;
		String admin_id = "";
		String admin_pwd = "";
		HttpSession session = null;
		type = request.getParameter("type");
		
		if(type.equals("login")) {
			admin_id = request.getParameter("admin_id");
			admin_pwd = request.getParameter("admin_pwd");
			admin = service.adminLogin(admin_id, admin_pwd);
			if (admin != null) {
				session = request.getSession();
				session.setAttribute("admin", admin);
				result = "/admin/pages/index.jsp";
			} else {
				result = "/admin/pages/login.jsp";
			}
		} else if (type.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			result = "/admin/pages/index.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
	}
}
