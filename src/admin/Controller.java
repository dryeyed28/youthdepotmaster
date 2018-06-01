package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Conroller
 */
public class Conroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Conroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		String type = "";
		String result = "";
		Service service = new ServiceImpl();
		Member m = null;
		String id = "", pwd = "";
		boolean flag = false;
		ArrayList<Member> data;
		HttpSession session = null;
		type = request.getParameter("type");
		if (type.equals("join")) {
			m = new Member();
			m.setId(request.getParameter("id"));
			m.setPwd(request.getParameter("pwd"));
			m.setName(request.getParameter("name"));
			m.setEmail(request.getParameter("email"));
			service.join(m);
			result = "member/login.jsp";
		} 
		else if (type.equals("search")) {
			session = request.getSession(false);
			id = (String) session.getAttribute("id");
			m = service.getMember(id);
			request.setAttribute("m", m);
			result = "member/search.jsp";
		} 
		
		
		else if (type.equals("edit")) {
			m = new Member();
			m.setId(request.getParameter("id"));
			m.setPwd(request.getParameter("pwd"));
			m.setEmail(request.getParameter("email"));
			service.editMember(m);
			result = "member/result.jsp";
		} else if (type.equals("list")) {
			data = service.getMembers();
			request.setAttribute("data", data);
			result = "member/list.jsp";
		} else if (type.equals("del")) {
			id = request.getParameter("id");
			service.delMember(id);
			result = "/Conroller?type=list";
		} else if (type.equals("checkId")) {
			id = request.getParameter("id");
			flag = service.checkId(id);
//			if (flag) {
//				request.setAttribute("id", id);
//			}
			request.setAttribute("flag", flag);
			result = "member/checkIdAjax.jsp";
		} else if (type.equals("login")) {
			id = request.getParameter("id");
			pwd = request.getParameter("pwd");
			flag = service.login(id, pwd);
			if (flag) {
				session = request.getSession();
				session.setAttribute("id", id);
				result = "member/result.jsp";
			} else {
				result = "member/login.jsp";
			}
		} else if (type.equals("logout")) {
			session = request.getSession(false);
			session.removeAttribute("id");
			session.invalidate();
			result = "member/login.jsp";
		} else if (type.equals("out")) {
			session = request.getSession(false);
			id = (String) session.getAttribute("id");
			service.delMember(id);
			result = "/Conroller?type=logout";
		} else if (type.equals("list_ajax")) {
			data = service.getMembers();
			request.setAttribute("data", data);
			result = "member/list_ajax.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
	}

}
