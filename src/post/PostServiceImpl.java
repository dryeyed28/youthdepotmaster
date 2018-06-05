package post;

import java.util.ArrayList;
import java.util.List;

import vo.Post;

public class PostServiceImpl implements PostService {
	
	PostDao dao = new PostDaoOracle();

	@Override
	public ArrayList<Post> boardList(int brd_id) {
		return dao.postList(brd_id);
	}

	@Override
	public Post getPostMenu(int brd_id, int post_id) {
		return dao.postMenu(brd_id ,post_id);
	}

	@Override
	public void deletePost(int post_id) {
		
	}

	@Override
	public void updatePost(Post post) {
		dao.updatePost(post);
		
	}

	@Override
	public void wirtePost(Post post) {
		dao.insertPost(post);
	}

	@Override
	public int findCount(int brd_id) {
		return dao.selectCount(brd_id);
	}

	@Override
	public ArrayList<Post> findAll(String mem_nickname, String post_title, String post_content) {
		return dao.searchAll(mem_nickname, post_title, post_content);
	}
	
	public static void main(String[] args) {
		PostService service = new PostServiceImpl();
		String mem_nickname = "빠른";
		String post_title= "빠른"; 
		String post_content= "빠른";
		ArrayList<Post> list = service.findAll(mem_nickname, post_title, post_content);
		System.out.println("service list 값 " + list);	
	}
}
