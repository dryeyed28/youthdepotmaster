package post;

import java.util.ArrayList;

import vo.Post;

public class PostServiceImpl implements PostService {
	
	PostDao dao = new PostDaoOracle();

	@Override
	public ArrayList<Post> boardList(int brd_id) {
		return dao.postList(brd_id);
	}

	@Override
	public Post getPostMenu(int post_id) {
		return dao.postMenu(post_id);
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
	

}
