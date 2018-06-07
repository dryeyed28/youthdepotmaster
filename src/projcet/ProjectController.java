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
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProjcetService service = new ProjcetServiceImpl();
		String type = request.getParameter("type");
		String forwardURL = "";
		int rPJT_id = 0;
		int rPay_id = 0;
		RKeeper keeper = null;
		ArrayList<RMeta> metalist = null;
		ArrayList<ROption> option = null;
		RMeta meta = null;
		Deposit deposit = null;
		RewardPay repay = null;
		if (type.equals("apply")) {
			String root = "C:/";
			File dir1 = new File(root + "files/image");
			File dir2 = new File(root + "files/imagedetail");
			File dir3 = new File(root + "files/profile");
			if (!dir1.exists())
				dir1.mkdirs();
			if (!dir2.exists())
				dir2.mkdirs();
			if (!dir3.exists())
				dir3.mkdirs();
			MultipartRequest mr = null;
			int maxPostSize = 1024 * 10000;
			String encoding = "UTF-8";
			try {
				mr = new MultipartRequest(request, root + "files", maxPostSize, encoding, new RenamePolicy());
			} catch (IOException e) {
				e.printStackTrace(); // maxPostSize, Posted content length
			}
			System.out.println(mr.getFile("image"));
			System.out.println(mr.getFile("imagedetail"));
			System.out.println(mr.getFile("profile"));
			File image = mr.getFile("image");
			File imagedetail = mr.getFile("imagedetail");
			File profile = mr.getFile("profile");
			String imageroot = root + "files/image/" + image.getName();
			String imagedetailroot = root + "files/imagedetail/" + imagedetail.getName();
			String profileroot = root + "files/profile/" + profile.getName();
			image.renameTo(new File(imageroot));
			imagedetail.renameTo(new File(imagedetailroot));
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
			rm.setrPJT_paper(imagedetailroot);
			rm.setrPJT_endDay((mr.getParameter("endDay")));
			ro.setrPJT_name(mr.getParameter("name"));
			ro.setrPJT_detail(mr.getParameter("detail"));
			ro.setrPJT_price(Integer.parseInt(mr.getParameter("price")));
			ro.setrPJT_limit(Integer.parseInt(mr.getParameter("limit")));
			ro.setrPJT_send(mr.getParameter("send"));
			ro.setrPJT_charge(Integer.parseInt(mr.getParameter("charge")));
			ro_list.add(ro);
			rs.setrPJT_url(mr.getParameter("UCCurl"));
			rs.setrPJT_thumbnail(mr.getParameter("sumnail"));
			rs.setrPJT_tag(mr.getParameter("tag"));
			rs.setrPJT_story(mr.getParameter("story"));
			RApply ra = new RApply(rk, rm, ro_list, rp, rs);
			service.applyinsert(ra);
			forwardURL = "user/mypage/made.jsp";
		} else if (type.equals("rewardMain")) {
			metalist = service.metalist();
			request.setAttribute("metalist", metalist);
			forwardURL = "user/pages/rewardmain.jsp";
		} else if (type.equals("rewardDetail")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			keeper = service.keeper(rPJT_id);
			meta = service.meta(rPJT_id);
			option = service.option(rPJT_id);
			RStory story = service.story(rPJT_id);
			ArrayList<RPost> rpost = service.rpost(rPJT_id);
			request.setAttribute("rpost", rpost);
			request.setAttribute("option", option);
			request.setAttribute("keeper", keeper);
			request.setAttribute("meta", meta);
			request.setAttribute("story", story);
			forwardURL = "user/pages/rewarddetaile.jsp";
		} else if (type.equals("pay")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			option = service.option(rPJT_id);
			request.setAttribute("option", option);
			forwardURL = "user/pages/pay.jsp";
		} else if (type.equals("payaddress")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			String str[] = request.getParameterValues("pqy1");
			int reward_id[] = new int[str.length];
			for (int i = 0; i < str.length; i++) {
				reward_id[i] = Integer.parseInt(str[i]);
			}
			ArrayList<ROption> payaddress = service.optionPay(rPJT_id, reward_id);
			request.setAttribute("payaddress", payaddress);
			forwardURL = "user/pages/payadress.jsp";
		} else if (type.equals("payresult")) {
			int mem_id = Integer.parseInt(request.getParameter("mem_id"));
			RewardPay rpay = service.orderReward(mem_id);
			request.setAttribute("rpay", rpay);
			forwardURL = "user/pages/paycheck.jsp";
		} else if (type.equals("projectrequest")) {
			metalist = service.project();
			request.setAttribute("project", metalist);
			forwardURL = "admin/pages/projectrequest.jsp";
		} else if (type.equals("content")) {
			rPJT_id = Integer.parseInt(request.getParameter("rPJT_id"));
			ProjectContentDto content = service.content(rPJT_id);
			request.setAttribute("content", content);
			forwardURL = "admin/pages/projectrequestcontent.jsp";
		} else if (type.equals("payaddressinsert")) {
			repay = new RewardPay();
			repay.setMem_name(request.getParameter("name"));
			repay.setrPay_address(request.getParameter("address"));
			repay.setrPay_phone(request.getParameter("tel"));
			repay.setrPay_request(request.getParameter("addressrequest"));
			repay.setrPay_total(Integer.parseInt(request.getParameter("comma")));
			service.rewardPay(repay);
			request.setAttribute("payaddressinsert",repay);
			forwardURL = "ProjectController?type=rewardDetail&rPJT_id="+ request.getParameter("rpjt_id");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
		// response.sendRedirect(forwardURL);
	}

}
