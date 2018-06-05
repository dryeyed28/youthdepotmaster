package post;

import java.util.ArrayList;

import vo.Post;

public interface PostDao {
	ArrayList<Post> postList(int brd_id);
	Post postMenu(int brd_id, int post_id);
	void deletePost(int post_id);
	void updatePost(Post post);
	void insertPost(Post post);
	int selectCount(int brd_id);
	ArrayList<Post> searchAll(String mem_nickName, String post_title, String post_content);
	ArrayList<Post> searchTitle(String post_title);
	ArrayList<Post> searchWriter(String mem_nickName);
	ArrayList<Post> searchContent(String post_content);
	
}
