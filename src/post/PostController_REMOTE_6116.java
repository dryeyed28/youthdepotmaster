package post;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import projcet.RenamePolicy;
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

		System.out.println("타입명 출력");
		String searchText = request.getParameter("searchText");


		int brd_id = 20;
		String forwardURL = "";
		String page = request.getParameter("page");
		Post p = null;
		Board b = null;
		
		int intPage = 1;
		int post_id = 0;
		if(type.equals("boardList")) {
			//brd_id = Integer.parseInt(request.getParameter("brd_id"));
			data = service.boardList(brd_id);
			request.setAttribute("data", data);
			//System.out.println("data!!! + " + data);
			forwardURL = "user/boards/boardlist.jsp";
		}else if(type.equals("boardListResult")) {
			brd_id = Integer.parseInt(request.getParameter("brd_id"));
			System.out.println(brd_id);
			data = service.boardList(brd_id);
			request.setAttribute("data", data);
			//System.out.println("data!!! + " + data);
			forwardURL = "user/boards/boardlistResult.jsp";
		} else if(type.equals("boardView")) {
			p = new Post();
			b = new Board();
			brd_id = Integer.parseInt(request.getParameter("brd"));
			post_id = Integer.parseInt(request.getParameter("id"));
			p = service.getPostMenu(brd_id, post_id);
			b.setBrd_id(brd_id);
			p.setBoard_id(b);
			request.setAttribute("p", p);
			forwardURL = "user/boards/boardview.jsp";
		}else if(type.equals("boardupdate")) {
			p = new Post();
			p.setPost_id(Integer.parseInt(request.getParameter("post_id")));
			p.setAdmin_id(request.getParameter("id"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			request.setAttribute("p", p);
			forwardURL = "user/boards/boardupdate.jsp";
		}else if(type.equals("boardupdateok")) {
			p = new Post();
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("brd")));
			p.setBoard_id(b);
			p.setPost_id(Integer.parseInt(request.getParameter("post_id")));
			p.setAdmin_id(request.getParameter("name"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			service.updatePost(p);
			forwardURL = "/PostController?type=boardView&id="+ request.getParameter("post_id")+ "&brd=" + request.getParameter("brd");
		} else if (type.equals("boardwrite")) {
			System.out.println("서블릿 호출");
			HttpSession session = request.getSession();
			session.setAttribute("id", "1");
			int mem_id = Integer.parseInt(session.getAttribute("id").toString());
			p = new Post();
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("bid")));
			p.setBoard_id(b);
			p.setMem_id(mem_id);
			p.setMem_nickName(request.getParameter("nickname"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			service.wirtePost(p);
			forwardURL = "/PostController?type=boardList";
		} else if (type.equals("adminboardwrite")) {
			String root = "C:/";
			MultipartRequest mr = null;
			int maxPostSize = 1024 * 10000;
			String encoding = "UTF-8";
			try {
				mr = new MultipartRequest(request, root + "files", maxPostSize, encoding, new RenamePolicy());
			} catch (IOException e) {
				e.printStackTrace(); // maxPostSize, Posted content length
			}
			File attachedfile = mr.getFile("uploadFiles");
			File dir = new File(root + "files/attachedfile");
			if (!dir.exists())
				dir.mkdirs();
			String attachedfileroot = root + "files/attachedfile/" + attachedfile.getName();
			attachedfile.renameTo(new File(attachedfileroot));
			
			b = new Board();
			p = new Post();
			b.setBrd_id(Integer.parseInt(request.getParameter("bid")));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			p.setAdmin_id("admin");
			service.wirtePost(p);
			forwardURL = "/BoardController?type=boardmenu";


		} else if(type.equals("searchAll")) {
			String mem_nickname = searchText;
			String post_title = searchText;
			String post_content = searchText;
			List<Post> list = service.findAll(mem_nickname, post_title, post_content);
			System.out.println("list 값" + list);
		} else if(type.equals("searchTitle")) {
		
		} else if(type.equals("searchWriter")) {
			
		} else if(type.equals("searchContent")) {
			

			/*forwardURL = "admin/boardMng/board1.jsp";*/
		} else if(type.equals("search")) {
			searchText = request.getParameter("searchText");
		}
 		
		RequestDispatcher  dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}

}
