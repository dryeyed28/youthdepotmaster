package projcet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.RProject;


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
		if (type.equals("apply")) {
			HttpSession session = request.getSession();
			session.setAttribute("id", "1");
			RApply ra = new RApply();
			RKeeper rk = new RKeeper();
			RMeta rm = new RMeta();
			RProject rp = new RProject();
			rp.setMem_id((int)session.getAttribute("id"));
			rp.setrPJT_progress(3);
			rp.setrPJT_state(2);
//			rk.setR_tel(Integer.parseInt(request.getParameter("r_tel")));
//			rm.setrPJT_title(request.getParameter("pjt_title"));
//			rm.setrPJT_subTitle(request.getParameter("pjt_subtitle"));
//			rm.setrTarget_amount(Integer.parseInt(request.getParameter("target_amount")));
//			rm.setrPJT_image(request.getParameter("pjt_image"));
//			rm.setrPJT_category(request.getParameter("pjt_category"));
//			rm.setrPJT_paper(request.getParameter("pjt_paper"));
//			rm.setrPJT_endDay(java.sql.Date.valueOf((request.getParameter("pjt_endDay"))));
			forwardURL = "user/mypage/made.jsp";
		}
//		RApply rApply = null;
//		service.applyinsert(rApply);
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
//		response.sendRedirect(forwardURL);
	}

}
