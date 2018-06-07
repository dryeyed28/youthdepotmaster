package board;

import java.util.ArrayList;

import vo.Board;

public interface BoardService {
	ArrayList<Board> getBoardList();
	void makeboard(Board board);
	void boardupdate(Board board);
	void boardDelete(int brd_id);
}
