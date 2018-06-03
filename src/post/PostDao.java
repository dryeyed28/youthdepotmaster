package post;

import java.util.ArrayList;

import vo.Post;

public interface PostDao {
	ArrayList<Post> postList(int brd_id);
	Post postMenu(int brd_id, int post_id);
	void deletePost(int post_id);
	void updatePost(Post post_id);
	void insertPost(Post post);
	int selectCount(int brd_id);
}
