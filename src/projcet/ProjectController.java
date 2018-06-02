package projcet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import projcet.RenamePolicy;
import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RProject;
import vo.RStory;
import vo.RewardPay;


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
		RMeta meta = null;
		if (type.equals("apply")) {
			System.out.println("Controller");
			MultipartRequest mr;
			MultipartRequest mr2;
			int maxPostSize = 1024*10000;
			String encoding = "UTF-8";
			try {
				mr = new MultipartRequest(request, "d:\\files", 
						maxPostSize, encoding, 
						new RenamePolicy());
				mr2 = new MultipartRequest(request, "d:\\files1", 
						maxPostSize, encoding, 
						new RenamePolicy());
			}catch(IOException e) {
				e.printStackTrace(); //maxPostSize, Posted content length 
			}
			RKeeper rk = new RKeeper();
			RMeta rm = new RMeta();
			RProject rp = new RProject();
			ROption ro = new ROption();
			RStory rs = new RStory();
			HttpSession session = request.getSession();
			session.setAttribute("id", 1);
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
			meta = service.meta(rPJT_id);
			ArrayList<ROption> option = service.option(rPJT_id);
			ArrayList<RPost> rpost = service.rpost(rPJT_id);
			request.setAttribute("rpost", rpost);
			request.setAttribute("option", option);
			request.setAttribute("keeper",keeper);
			request.setAttribute("meta", meta);
			forwardURL = "user/pages/rewarddetaile.jsp";
		} else if(type.equals("pay")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			ArrayList<ROption> option = service.option(rPJT_id);
			request.setAttribute("option", option);
			forwardURL = "user/pages/pay.jsp";
		} else if(type.equals("payaddress")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			int reward_id = Integer.parseInt(request.getParameter("reward_id"));
			ROption payaddress = service.optionPay(rPJT_id, reward_id);
			request.setAttribute("payaddress", payaddress);
			forwardURL = "user/pages/payadress.jsp";
		} else if(type.equals("payresult")) {
			int mem_id = Integer.parseInt(request.getParameter("mem_id"));
			RewardPay rpay = service.orderReward(mem_id);
			request.setAttribute("rpay", rpay);
			forwardURL = "user/pages/paycheck.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
//		response.sendRedirect(forwardURL);
	}

}
