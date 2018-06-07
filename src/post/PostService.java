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
	public ArrayList<Post> findAll(String mem_nickName, String post_title, String post_content);
	public ArrayList<Post> findTitle(String post_title);
	public ArrayList<Post> findWriter(String mem_nickName);
	public ArrayList<Post> findContent(String post_content);
}
