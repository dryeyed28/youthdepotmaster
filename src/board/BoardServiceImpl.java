package board;

import java.util.ArrayList;

import vo.Board;

public class BoardServiceImpl implements BoardService {
	
	private BoardDao dao = new BoardDaoOracle();

	@Override
	public ArrayList<Board> getBoardList() {
		return dao.boardList();
	}


}
