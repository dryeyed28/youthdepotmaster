package post;

import java.util.ArrayList;

import vo.Post;

public interface PostDao {
	ArrayList<Post> postList(int brd_id, int realPage);
	Post postMenu(int brd_id, int post_id);
	void deletePost(int post_id);
	void updatePost(Post post);
	void insertPost(Post post);
	int selectCount(int brd_id);
	ArrayList<Post> searchAll(int brd_id, String mem_nickName, String post_title, String post_content);
	ArrayList<Post> searchTitle(int brd_id, String post_title);
	ArrayList<Post> searchWriter(int brd_id, String mem_nickName);
	ArrayList<Post> searchContent(int brd_id, String post_content);
	ArrayList<Post> getPostList(int brd_id);
	
}
