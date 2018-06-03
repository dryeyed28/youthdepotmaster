package post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Board;
import vo.Post;

public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PostService service = new PostServiceImpl();
		ArrayList<Post> data;
		String type = request.getParameter("type");
		String forwardURL = "";
		String page = request.getParameter("page");
		Post p = null;
		Board b = null;
		int intPage = 1;
		int brd_id=20;
		int post_id = 0;
		if(type.equals("boardList")) {
			//brd_id = Integer.parseInt(request.getParameter("brd_id"));
			data = service.boardList(brd_id);
			request.setAttribute("data", data);
			//System.out.println("data!!! + " + data);
			forwardURL = "user/boards/boardlist.jsp";
		} else if(type.equals("boardView")) {
			post_id = Integer.parseInt(request.getParameter("id"));
			p = service.getPostMenu(post_id);
			request.setAttribute("p", p);
			forwardURL = "user/boards/boardview.jsp";
		}else if(type.equals("boardupdate")) {
			p = new Post();
			p.setAdmin_id(request.getParameter("id"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			request.setAttribute("p", p);
			forwardURL = "user/boards/boardupdate.jsp";
		} else if (type.equals("boardwrite")) {
			System.out.println("서블릿 호출");
			HttpSession session = request.getSession();
			int mem_id = (int)session.getAttribute("id");
			p = new Post();
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("bid")));
			p.setBoard_id(b);
			p.setAdmin_id(request.getParameter("admin_id"));
			p.setMem_id(mem_id);
			p.setMem_nickName(request.getParameter("nickname"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			service.wirtePost(p);
			forwardURL = "user/boards/boardwrite.jsp";
		} else if (type.equals("boardwriteok")) {
			
			forwardURL = "user/boards/boardview.jsp";
		}

		
		RequestDispatcher  dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
