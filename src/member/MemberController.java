package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import vo.Member;
import vo.PageBean;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberController() {
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
		String forwardURL = "";
		int intPage = 0;
		
		MemberService svic = new MemberServiceImpl();
		
		type = request.getParameter("type");
		System.out.println("성공");
		if (type.equals("idcheck")) {
			String id = request.getParameter("id");
			try {
				System.out.println("아이디체크");
				int rslt = MemberService.idCheck(id);
				request.setAttribute("rslt", rslt);
				forwardURL = "user/mypage/idcheckrslt.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(type.equals("selectAll")) {
			//admin 회원관리
			String page = request.getParameter("page");
			
			if(page != null) {
				intPage = Integer.parseInt(page);
			}
			
			try {
			int totalCount = svic.findCount();
			
			int totalPage = 0;
			int cntPerPage = 3;
			totalPage = (int)Math.ceil((double)totalCount / cntPerPage);
			
			int cntPerPageGroup = 5;
			int startPage = (int)Math.floor((double)(intPage)/(cntPerPageGroup+1))*cntPerPageGroup+1;
			int endPage = startPage+cntPerPageGroup-1;
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			List<Member> list = svic.findAll();
			//request.setAttribute("member", list);
			PageBean<Member> pb = new PageBean<>();
			pb.setCurrentPage(intPage);
			pb.setTotalPage(totalPage);
			pb.setList(list);
			pb.setStartPage(startPage);
			pb.setEndPage(endPage);
			
			request.setAttribute("pagebean", pb);
			
			} catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("result", e.getMessage());
			}
			result = "/admin/pages/memberlistresult.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
	}
}
