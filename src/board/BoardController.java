package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Board;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		}else if (type.equals("make")) {
			b = new Board();
			b.setBrd_name(request.getParameter("title"));
			b.setBrd_type(request.getParameter("board"));
			service.makeboard(b);
			forwardURL = "BoardController?type=boardmenu";
		} else if (type.equals("update")) {
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("brd")));
			b.setBrd_name(request.getParameter("name"));
			b.setBrd_type(request.getParameter("brd_type"));
			request.setAttribute("board", b);
			forwardURL = "admin/boardMng/updateboard.jsp";
		} else if (type.equals("updateok")) {
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("brd")));
			b.setBrd_name(request.getParameter("name"));
			b.setBrd_type(request.getParameter("brd_type"));
			service.boardupdate(b);
			forwardURL = "BoardController?type=boardmenu";
		} else if (type.equals("adminboardlist")) {
			boardlist = service.getBoardList();
			request.setAttribute("boardlist", boardlist);
			forwardURL = "admin/template/adminboardrslt.jsp";
		} else if (type.equals("userboardlist")) {
			boardlist = service.getBoardList();
			request.setAttribute("boardlist", boardlist);
			forwardURL = "user/template/userboardrslt.jsp";
		}  else if (type.equals("delete")) {
			int brd_id = Integer.parseInt(request.getParameter("brd"));
			service.boardDelete(brd_id);
			forwardURL = "BoardController?type=boardmenu";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
