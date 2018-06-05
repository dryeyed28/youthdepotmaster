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
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String forwardURL = "";
		BoardService service = new BoardServiceImpl();
		Board b = null;
		ArrayList<Board> boardlist;
		if (type.equals("boardmenu")) {
			boardlist = service.getBoardList();
			request.setAttribute("boardlist", boardlist);
			forwardURL = "admin/boardMng/tables.jsp";
		} else if (type.equals("make")) {
			Board board = new Board();
			board.setBrd_name(request.getParameter("title"));
			service.makeboard(board);
			forwardURL = "admin/boardMng/tables.jsp";
		} else if (type.equals("update")) {
			
		}
		RequestDispatcher  dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
