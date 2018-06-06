package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardService;
import board.BoardServiceImpl;
import vo.Admin;
import vo.Board;

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
		System.out.println("AdminController doPost() 요청");
		
		String type = "";
		String result = "";
		String loginResult = "";
		AdminService service = new AdminServiceImpl();
		Admin admin = null;
		String admin_id = "";
		String admin_pwd = "";
		HttpSession session = null;
		type = request.getParameter("type");
		admin_id = request.getParameter("admin_id");
		admin_pwd = request.getParameter("admin_pwd");
		
		System.out.println("어드민 id, pwd값 : " + admin_id + ", " + admin_pwd);
		
		if(type.equals("login")) {
			loginResult = service.adminLogin(admin_id, admin_pwd);
			request.setAttribute("loginResult", loginResult);
			result = "/admin/pages/loginresult.jsp";
			System.out.println("loginResult 값 :" + loginResult);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
	}
}
