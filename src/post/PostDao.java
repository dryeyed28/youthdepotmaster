package post;

import java.util.ArrayList;
import java.util.List;

import vo.Post;

public interface PostDao {
	ArrayList<Post> postList(int brd_id);
	Post postMenu(int brd_id, int post_id);
	void deletePost(int post_id);
	void updatePost(Post post);
	void insertPost(Post post);
	int selectCount(int brd_id);
	List<Post> searchAll(String mem_nickname, String post_title, String post_content);
	List<Post> searchTitle(String post_title);
	List<Post> searchWriter(String mem_nickname);
	List<Post> searchContent(String post_content);
	
}
