package projcet;

import vo.RApply;

public class ProjcetServiceImpl implements ProjcetService {
	ProjcetDao dao = new ProjcetDaoOracle();
	public void applyinsert(RApply rApply) {
		dao.apllyinsert(rApply);
	}
}
