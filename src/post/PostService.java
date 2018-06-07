package post;

import java.util.ArrayList;

import vo.PageBean;
import vo.Post;

public interface PostService {
	public ArrayList<Post> boardList(int brd_id, int realPage);
	public ArrayList<Post> postList(int brd_id);
	public Post getPostMenu(int brd_id, int post_id);
	public void deletePost (int post_id);
	public void updatePost(Post post);
	public void wirtePost(Post post);
	public int findCount(int brd_id);
	public ArrayList<Post> findAll(int brd_id, String mem_nickName, String post_title, String post_content);
	public ArrayList<Post> findTitle(int brd_id, String post_title);
	public ArrayList<Post> findWriter(int brd_id, String mem_nickName);
	public ArrayList<Post> findContent(int brd_id, String post_content);
}
