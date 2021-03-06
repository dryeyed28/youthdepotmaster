package totalpay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardServiceImpl;
import projcet.ProjcetService;
import projcet.ProjcetServiceImpl;
import vo.Board;
import vo.Deposit;
import vo.RewardPay;

public class TotalPayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public TotalPayController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		BoardService service1 = new BoardServiceImpl();
		TotalPayService service = new TotalPayServiceImpl();
		String type = request.getParameter("type");
		ArrayList<Board> boardlist;
		String forwardURL = "";
		ArrayList<RewardPay> totalpay = null;
		ArrayList<Deposit> yeoljeong = null;
		if(type.equals("totalpay")) {
			totalpay = service.rewardpay();
			request.setAttribute("totalpay", totalpay);
			forwardURL = "admin/payMng/totalpay.jsp";
		} else if(type.equals("yeoljeong")) {
			yeoljeong = service.yeoljeong();
			request.setAttribute("yeoljeong", yeoljeong);
			forwardURL = "admin/payMng/yeoljeongpay.jsp";
		} else if(type.equals("refund")) {
			yeoljeong = service.refund();
			request.setAttribute("yeoljeong", yeoljeong);
			forwardURL = "admin/payMng/refundinfo.jsp";
		} else if(type.equals("profit")) {
			ArrayList<ProfitDto> profit = service.profit();
			request.setAttribute("profit", profit);
			forwardURL = "admin/payMng/profit.jsp";
		} else if(type.equals("refundok")) {
			int dep = Integer.parseInt(request.getParameter("dep"));
			int id = Integer.parseInt(request.getParameter("id"));
			service.refundok(dep, id);
			yeoljeong = service.refund();
			request.setAttribute("yeoljeong", yeoljeong);
			forwardURL = "admin/payMng/refundinfo.jsp";
		}
		boardlist = service1.getBoardList();
		request.setAttribute("boardlist", boardlist);
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
