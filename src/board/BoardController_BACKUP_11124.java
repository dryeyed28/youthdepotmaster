package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Board;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = "";
=======
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		String type = request.getParameter("type");
>>>>>>> 8baae7cb4c3dd8f8baf1e4f19a355b3375268a49
		String forwardURL = "";
		BoardService service = new BoardServiceImpl();
		Board b = null;
		ArrayList<Board> boardlist;
		if (type.equals("boardmenu")) {
			boardlist = service.getBoardList();
			request.setAttribute("boardlist", boardlist);
<<<<<<< HEAD
			forwardURL = "template/header.jsp";
		} else if (type.equals("make")) {
			Board board = new Board();
			board.setBrd_name(request.getParameter("title"));
			service.makeboard(board);
			forwardURL = "admin/boardMng/tables.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
=======
			forwardURL = "admin/boardMng/tables.jsp";
		}
		
		RequestDispatcher  dispatcher = request.getRequestDispatcher(forwardURL);
>>>>>>> 8baae7cb4c3dd8f8baf1e4f19a355b3375268a49
		dispatcher.forward(request, response);
	}

}
