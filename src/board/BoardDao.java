package board;

import java.util.ArrayList;

import vo.Board;

public interface BoardDao {
	ArrayList<Board> boardList();
	void insertboard(Board board);
	void updateboard(Board board);
	void deleteBoard(int brd_id);
}
