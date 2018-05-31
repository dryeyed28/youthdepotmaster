package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberInterface;

/**
 * Servlet implementation class MemberController
 */
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = "";
		String forwardURL = "";
		MemberService service = new MemberServiceImpl();
		MemberInterface svic = new service.MemberService();
		
		type = request.getParameter("type");
		if (type.equals("idcheck")) {
			String id = request.getParameter("id");
			try {
				int rslt = svic.idCheck(id);
				request.setAttribute("rslt", rslt);
				forwardURL = "idcheckrslt.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	
	}

	
	

}
