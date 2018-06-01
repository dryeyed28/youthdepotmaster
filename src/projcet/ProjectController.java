package projcet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RProject;
import vo.RStory;


public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProjcetService service = new ProjcetServiceImpl();
		String type = request.getParameter("type");
		String forwardURL = "";
		int rPJT_id = 0;
		RKeeper keeper = null;
		if (type.equals("apply")) {
			System.out.println("Controller");
			HttpSession session = request.getSession();
			session.setAttribute("id", 1);
			RKeeper rk = new RKeeper();
			RMeta rm = new RMeta();
			RProject rp = new RProject();
			ROption ro = new ROption();
			RStory rs = new RStory();
			rp.setMem_id((int)session.getAttribute("id"));
			rp.setrPJT_progress(3);
			rp.setrPJT_state(2);
			rk.setR_tel(Integer.parseInt(request.getParameter("tel")));
			rk.setR_name(request.getParameter("kepper_name"));
			rk.setR_profile(request.getParameter("profile"));
			rk.setR_email(request.getParameter("email"));
			rk.setR_url(request.getParameter("siteUrl"));
			rm.setrPJT_title(request.getParameter("title"));
			rm.setrPJT_subTitle(request.getParameter("subtitle"));
			rm.setrTarget_amount(Integer.parseInt(request.getParameter("amount")));
			rm.setrPJT_image(request.getParameter("image"));
			rm.setrPJT_category(request.getParameter("category"));
			rm.setrPJT_paper(request.getParameter("paper"));
			rm.setrPJT_endDay((request.getParameter("endDay")));
			ro.setrPJT_name(request.getParameter("name"));
			ro.setrPJT_detail(request.getParameter("detail"));
			ro.setrPJT_price(Integer.parseInt(request.getParameter("price")));
			ro.setrPJT_limit(Integer.parseInt(request.getParameter("limit")));
			ro.setrPJT_send(request.getParameter("send"));
			ro.setrPJT_charge(Integer.parseInt(request.getParameter("charge")));
			rs.setrPJT_url(request.getParameter("UCCurl"));
			rs.setrPJT_sumnail(request.getParameter("sumnail"));
			rs.setrPJT_tag(request.getParameter("tag"));
			rs.setrPJT_story(request.getParameter("story"));
			RApply ra = new RApply(rk, rm, ro, rp, rs);
			service.applyinsert(ra);
			forwardURL = "user/mypage/made.jsp";
		} else if(type.equals("rewardDetail")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			keeper = service.keeper(rPJT_id);
			request.setAttribute("keeper",keeper);
			forwardURL = "user/pages/rewarddetaile.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
//		response.sendRedirect(forwardURL);
	}

}
