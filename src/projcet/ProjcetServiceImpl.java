package projcet;

import vo.RApply;
import vo.RKeeper;

public class ProjcetServiceImpl implements ProjcetService {
	ProjcetDao dao = new ProjcetDaoOracle();

	public void applyinsert(RApply rApply) {
		dao.apllyinsert(rApply);
	}
	@Override
	public RKeeper keeper(int rPJT_id) {
		return dao.getKeeper(rPJT_id);
	}
	
}
