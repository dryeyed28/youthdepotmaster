package board;

import java.util.ArrayList;

import vo.Board;

public class BoardServiceImpl implements BoardService {
	
	private BoardDao dao = new BoardDaoOracle();

	@Override
	public ArrayList<Board> getBoardList() {
		return dao.boardList();
	}

	@Override
	public void makeboard(Board board) {
		dao.insertboard(board);
	}

	@Override
	public void boardupdate(Board board) {
		dao.updateboard(board);
	}

	@Override
	public void boardDelete(int brd_id) {
		dao.deleteBoard(brd_id);
	}


}
