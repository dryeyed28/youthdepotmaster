package board;

import java.io.IOException;
import java.util.ArrayList;

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
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		String type = "";
		String result = "";
		BoardService service = new BoardServiceImpl();
		Board m = null;
		ArrayList<Board> boardlist;
		type = request.getParameter("type");
		if (type.equals("boardmenu")) {
			boardlist = service.getBoardList();
			request.setAttribute("boardlist", boardlist);
			result = "template/header.jsp";
		}
	}

}
