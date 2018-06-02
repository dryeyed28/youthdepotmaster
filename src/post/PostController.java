package post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String type = request.getParameter("type");
		String forwardURL = "";
		PostService service = new PostServiceImpl();
		Post p = null;
		int brd_id=20;
		int post_id = 0;
		ArrayList<Post> data;
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
			Post post = new Post();
			post.setAdmin_id(request.getParameter("id"));
			post.setPost_title(request.getParameter("title"));
			post.setPost_content(request.getParameter("content"));
			request.setAttribute("p", post);
			forwardURL = "user/boards/boardupdate.jsp";
		}

		
		RequestDispatcher  dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
