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
		
		System.out.println("MemberController doPost() 요청");
		
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
				int rslt = svic.idCheck(id);
				request.setAttribute("rslt", rslt);
				forwardURL = "user/mypage/idcheckrslt.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(type.equals("selectAll")) {
			//admin 회원관리
			String page = request.getParameter("page");
			System.out.println("page 값은 : " + page);
			
			if(page != null) {
				intPage = Integer.parseInt(page);
			}
			
			try {
			int totalCount = svic.findCount();
			System.out.println("총 페이지 수(findCount()) : " + totalCount);
			
			int totalPage = 0;
			int cntPerPage = 3;
			totalPage = (int)Math.ceil((double)totalCount / cntPerPage);
			
			int cntPerPageGroup = 5;
			int startPage = (int)Math.floor((double)(intPage)/(cntPerPageGroup+1))*cntPerPageGroup+1;
			int endPage = startPage+cntPerPageGroup-1;
			System.out.println("스타트페이지 수 : " + startPage);
			
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
			result = "/admin/pages/memberlistresult2.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
	}
}
