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

import board.BoardService;
import board.BoardServiceImpl;
import projcet.RenamePolicy;
import vo.Board;
import vo.PageBean;
import vo.Post;

public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostController() {
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
		PostService service = new PostServiceImpl();
		ArrayList<Board> boardlist;
		ArrayList<Post> data;
		BoardService service1 = new BoardServiceImpl();
		String type = request.getParameter("type");
		String searchText = request.getParameter("searchText");
		String forwardURL = "";
		String redirectURL = "";
		int brd_id = 20;
		int post_id = 0;
		int realPage = 0;
		Post p = null;
		Board b = null;
		if(type.equals("boardList")) {
			//brd_id = Integer.parseInt(request.getParameter("brd_id"));
			realPage = 3;
			data = service.boardList(brd_id, realPage);
			String page = request.getParameter("page");
			int totalCount = service.findCount(brd_id);
			int cntPerPage = 10; //1페이지 별 10건씩 게시글을 보여준다.
			
			if(page != null) {
				realPage = Integer.parseInt(page);
			}
			int totalPage = (int) Math.ceil((double) totalCount / cntPerPage);
			int cntPerPageGroup = 5; // 페이지 그룹별 5페이지씩 보여준다.
			int startPage = (int) (realPage / cntPerPageGroup + 0.8) * cntPerPageGroup - cntPerPageGroup + 1;
			int endPage = startPage + cntPerPageGroup - 1;
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			PageBean<Post> pb = new PageBean<>();
			pb.setCurrentPage(realPage);
			pb.setTotalPage(totalPage);
			pb.setList(data);
			pb.setStartPage(startPage);
			pb.setEndPage(endPage);
			pb.setTotalCount(totalCount);
			pb.setCntPerPage(cntPerPageGroup);
			
			request.setAttribute("realPage", realPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("data", data);
			System.out.println(realPage);
			forwardURL = "user/boards/boardlist.jsp";
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
		} else if (type.equals("boardupdate")) {
			b = new Board();
			p = new Post();
			b.setBrd_id(Integer.parseInt(request.getParameter("brd")));
			p.setPost_id(Integer.parseInt(request.getParameter("post_id")));
			p.setAdmin_id(request.getParameter("id"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			request.setAttribute("p", p);
			forwardURL = "user/boards/boardupdate.jsp";
		} else if (type.equals("boardupdateok")) {
			p = new Post();
			b = new Board();
			b.setBrd_id(Integer.parseInt(request.getParameter("brd")));
			p.setBoard_id(b);
			p.setPost_id(Integer.parseInt(request.getParameter("post_id")));
			p.setAdmin_id(request.getParameter("name"));
			p.setPost_title(request.getParameter("title"));
			p.setPost_content(request.getParameter("content"));
			service.updatePost(p);
			forwardURL = "/PostController?type=boardView&id=" + request.getParameter("post_id") + "&brd="
					+ request.getParameter("brd");
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
			b = new Board();
			p = new Post();
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
			File dir0 = new File(root + "files");
			if (dir0.exists())
				dir0.mkdirs();
			if (!dir.exists())
				dir.mkdirs();
			if (attachedfile != null) {
				String attachedfileroot = root + "files/attachedfile/" + attachedfile.getName();
				attachedfile.renameTo(new File(attachedfileroot));
				p.setPost_file(attachedfile.getName());
			}
			//b.setBrd_id(Integer.parseInt(request.getParameter("bid")));
			p.setPost_title(mr.getParameter("title"));
			p.setPost_content(mr.getParameter("content"));
			p.setAdmin_id("admin");
			service.wirtePost(p);
			forwardURL = "/admin/boardMng/board1.jsp";
		} else if (type.equals("searchAll")) {
			if (!"".equals(searchText)) {
				// 검색문자열이 있는 경우
				String mem_nickName = searchText;
				String post_title = searchText;
				String post_content = searchText;
				data = service.findAll(mem_nickName, post_title, post_content);
				request.setAttribute("data", data);
				forwardURL = "/user/boards/boardlist.jsp";
			} else {
				//빈문자열을 검색할 경우 = 전체 검색
				data = service.boardList(brd_id, realPage);
				request.setAttribute("data", data);
				forwardURL = "/user/boards/boardlist.jsp";
			}
		} else if (type.equals("searchTitle")) {
			if (!"".equals(searchText)) {
				String post_title = searchText;
				ArrayList<Post> list = service.findTitle(post_title);
				request.setAttribute("data", list);
				forwardURL = "/user/boards/boardlist.jsp";
			} else {
				//빈문자열을 검색할 경우 = 전체 검색
				data = service.boardList(brd_id, realPage);
				request.setAttribute("data", data);
				forwardURL = "/user/boards/boardlist.jsp";
			}
		} else if (type.equals("searchWriter")) {
			if (!"".equals(searchText)) {
				String mem_nickName = searchText;
				ArrayList<Post> list = service.findWriter(mem_nickName);
				request.setAttribute("data", list);
				forwardURL = "/user/boards/boardlist.jsp";
			} else {
				//빈문자열을 검색할 경우 = 전체 검색
				data = service.boardList(brd_id, realPage);
				request.setAttribute("data", data);
				forwardURL = "/user/boards/boardlist.jsp";
			}
		} else if (type.equals("searchContent")) {
			/* forwardURL = "admin/boardMng/board1.jsp"; */
			if (!"".equals(searchText)) {
			String post_content = searchText;
			ArrayList<Post> list = service.findContent(post_content);
			request.setAttribute("data", list);
			forwardURL = "/user/boards/boardlist.jsp";
			}else {
				//빈문자열을 검색할 경우 = 전체 검색
				data = service.boardList(brd_id, realPage);
				request.setAttribute("data", data);
				forwardURL = "/user/boards/boardlist.jsp";
			}
		}
		boardlist = service1.getBoardList();
		request.setAttribute("boardlist", boardlist);
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		dispatcher.forward(request, response);
	}
}