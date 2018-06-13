package member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberService;
import vo.Member;
import vo.PageBean;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		MemberService service = new MemberServiceImpl();
		String type = "";
		String result = "";

		Member m = null;
		String userId = "";
		int intPage = 0;
		int mem_id = 0;
		HttpSession session = null;

		MemberService svic = new MemberServiceImpl();

		type = request.getParameter("type");
		if (type.equals("idcheck")) {
			try {
				System.out.println("아이디체크");
				// int rslt = MemberService.idCheck(id);
				// request.setAttribute("rslt", rslt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (type.equals("selectAll")) {
			// admin 회원관리
			String page = request.getParameter("page");
			if (page != null) {
				intPage = Integer.parseInt(page);
			}
			try {
				int totalCount = svic.findCount();
				int totalPage = 0;
				int cntPerPage = 3;
				totalPage = (int) Math.ceil((double) totalCount / cntPerPage);
				int cntPerPageGroup = 5;
				int startPage = (int) Math.floor((double) (intPage) / (cntPerPageGroup + 1)) * cntPerPageGroup + 1;
				int endPage = startPage + cntPerPageGroup - 1;
				if (endPage > totalPage) {
					endPage = totalPage;
				}
				List<Member> list = svic.findAll();
				// request.setAttribute("member", list);
				PageBean<Member> pb = new PageBean<>();
				pb.setCurrentPage(intPage);
				pb.setTotalPage(totalPage);
				pb.setList(list);
				pb.setStartPage(startPage);
				pb.setEndPage(endPage);
				
				session = request.getSession();
				session.setAttribute("pagebean", pb);
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("result", e.getMessage());
			}
			result = "/admin/memberMng/member.jsp";
		} else if (type.equals("signup")) {
			int sex = Integer.parseInt(request.getParameter("radioAnswer"));
			m = new Member();
			m.setMem_userId(request.getParameter("userid"));
			m.setMem_email(request.getParameter("email"));
			m.setMem_password(request.getParameter("password"));
			m.setMem_userName(request.getParameter("username"));
			m.setMem_nickName(request.getParameter("nickname"));
			m.setMem_phone(request.getParameter("tel"));
			m.setMem_sex(sex);
			service.signup(m);
			request.setAttribute("m", m);
			result = "user/mypage/login.jsp";
		} else if (type.equals("login")) {
			// System.out.println("로그인");
			m = new Member();
			m.setMem_userId(request.getParameter("userid"));
			m.setMem_password(request.getParameter("pwd"));
			Member member = new Member();
			member = service.login(m);
			if (member != null) {
				session = request.getSession();
				session.setAttribute("mem_id", member.getMem_id());
				session.setAttribute("nickName", member.getMem_nickName());
				result = "redirect:/user/pages/index.jsp";
				request.setAttribute("rslt", "0");
			} else {
				result = "redirect:user/mypage/login.jsp";
			}
		} else if (type.equals("mypage")) {
			m = new Member();
			session = request.getSession();
			mem_id = Integer.parseInt(session.getAttribute("mem_id").toString());
			m = service.mypage(mem_id);
			request.setAttribute("member", m);
			result = "user/mypage/mypage.jsp";
		} else if (type.equals("membermodify")) {
			session = request.getSession();
			Member member = new Member();
			PageBean<Member> list  = (PageBean) session.getAttribute("pagebean");
			session.setAttribute("pagebean", list);
			result = "admin/memberMng/membermodify.jsp";
		} else if (type.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			result = "redirect:/user/pages/index.jsp";
		}
//		} else if (type.equals("modify")) {
//			session = request.getSession();
//			session.getAttribute(")
//		}
		
		if(result.contains("redirect:")) {
			String redirectURL = result.substring("redirect:".length());
			response.sendRedirect(request.getContextPath() + redirectURL);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(result);
			dispatcher.forward(request, response);
		}
	}
}
