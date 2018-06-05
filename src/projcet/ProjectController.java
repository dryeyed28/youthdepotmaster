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
import vo.Deposit;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProjcetService service = new ProjcetServiceImpl();
		String type = request.getParameter("type");
		String forwardURL = "";
		int rPJT_id = 0;
		RKeeper keeper = null;
		ArrayList<RMeta> metalist = null;
		ArrayList<ROption> option = null;
		RMeta meta = null;
		Deposit deposit = null;
		if (type.equals("apply")) {
			String root = "C:/";
			MultipartRequest mr = null;
			int maxPostSize = 1024 * 10000;
			String encoding = "UTF-8";
			try {
				mr = new MultipartRequest(request, root + "files", maxPostSize, encoding, new RenamePolicy());
			} catch (IOException e) {
				e.printStackTrace(); // maxPostSize, Posted content length
			}
			File image = mr.getFile("image");
			File paper = mr.getFile("paper");
			File profile = mr.getFile("profile");
			File dir1 = new File(root + "files/image");
			File dir2 = new File(root + "files/paper");
			File dir3 = new File(root + "files/profile");
			if (!dir1.exists())
				dir1.mkdirs();
			if (!dir2.exists())
				dir2.mkdirs();
			if (!dir3.exists())
				dir3.mkdirs();
			String imageroot = root + "files/image/" + image.getName();
			String paperroot = root + "files/paper/" + paper.getName();
			String profileroot = root + "files/profile/" + profile.getName();
			image.renameTo(new File(imageroot));
			paper.renameTo(new File(paperroot));
			profile.renameTo(new File(profileroot));
			RKeeper rk = new RKeeper();
			RMeta rm = new RMeta();
			RProject rp = new RProject();
			ArrayList<ROption> ro_list = new ArrayList<ROption>();
			ROption ro = new ROption();
			RStory rs = new RStory();
			HttpSession session = request.getSession();
			session.setAttribute("id", 1);
			rp.setMem_id((int) session.getAttribute("id"));
			rp.setrPJT_progress(3);
			rp.setrPJT_state(2);
			rk.setR_tel(Integer.parseInt(mr.getParameter("tel")));
			rk.setR_name(mr.getParameter("kepper_name"));
			rk.setR_profile(profileroot);
			rk.setR_email(mr.getParameter("email"));
			rk.setR_url(mr.getParameter("siteUrl"));
			rm.setrPJT_title(mr.getParameter("title"));
			rm.setrPJT_subTitle(mr.getParameter("subtitle"));
			rm.setrTarget_amount(Integer.parseInt(mr.getParameter("amount")));
			rm.setrPJT_image(imageroot);
			rm.setrPJT_category(mr.getParameter("category"));
			rm.setrPJT_paper(paperroot);
			rm.setrPJT_endDay((mr.getParameter("endDay")));
			ro.setrPJT_name(mr.getParameter("name"));
			ro.setrPJT_detail(mr.getParameter("detail"));
			ro.setrPJT_price(Integer.parseInt(mr.getParameter("price")));
			ro.setrPJT_limit(Integer.parseInt(mr.getParameter("limit")));
			ro.setrPJT_send(mr.getParameter("send"));
			ro.setrPJT_charge(Integer.parseInt(mr.getParameter("charge")));
			ro_list.add(ro);
			rs.setrPJT_url(mr.getParameter("UCCurl"));
			rs.setrPJT_sumnail(mr.getParameter("sumnail"));
			rs.setrPJT_tag(mr.getParameter("tag"));
			rs.setrPJT_story(mr.getParameter("story"));
			RApply ra = new RApply(rk, rm, ro_list, rp, rs);
			service.applyinsert(ra);
			forwardURL = "user/mypage/made.jsp";
		} else if(type.equals("rewardMain")) {
			metalist = service.metalist();
			request.setAttribute("metalist", metalist);
			forwardURL = "user/pages/rewardmain.jsp";
		} else if (type.equals("rewardDetail")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			keeper = service.keeper(rPJT_id);
			meta = service.meta(rPJT_id);
			option = service.option(rPJT_id);
			ArrayList<RPost> rpost = service.rpost(rPJT_id);
			request.setAttribute("rpost", rpost);
			request.setAttribute("option", option);
			request.setAttribute("keeper", keeper);
			request.setAttribute("meta", meta);
			forwardURL = "user/pages/rewarddetaile.jsp";
		} else if (type.equals("pay")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			option = service.option(rPJT_id);
			request.setAttribute("option", option);
			forwardURL = "user/pages/pay.jsp";
		} else if (type.equals("payaddress")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
<<<<<<< HEAD
			int reward_id[] = Integer.request.getParameterValues("reward_id");
			int[] exampleNo = (int[]) new IntegerArrayConverter().convert(null, str);

			option = service.optionPay(rPJT_id, reward_id);
			request.setAttribute("payaddress", option);
=======
			String str[] = request.getParameterValues("pqy1");
			int reward_id[] =  new int[str.length];
			for(int i = 0;i<str.length;i++){
				reward_id[i] = Integer.parseInt(str[i]);	
			}
			ArrayList<ROption> payaddress = service.optionPay(rPJT_id, reward_id);
			request.setAttribute("payaddress", payaddress);
>>>>>>> 28ca578a0bd7a5ff8c0d9fede580e8ee7c171930
			forwardURL = "user/pages/payadress.jsp";
		} else if (type.equals("payresult")) {
			int mem_id = Integer.parseInt(request.getParameter("mem_id"));
			RewardPay rpay = service.orderReward(mem_id);
			request.setAttribute("rpay", rpay);
			forwardURL = "user/pages/paycheck.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
		// response.sendRedirect(forwardURL);
	}

}
