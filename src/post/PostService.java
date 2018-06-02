package post;

import java.util.ArrayList;

import vo.Post;

public interface PostService {
	public ArrayList<Post> boardList(int brd_id);
	public Post getPostMenu(int post_id);
	public void deletePost (int post_id);
	public void updatePost(vo.Post post);
}
