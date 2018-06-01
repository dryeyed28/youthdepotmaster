package projcet;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;

public class ProjcetServiceImpl implements ProjcetService {
	ProjcetDao dao = new ProjcetDaoOracle();

	public void applyinsert(RApply rApply) {
		dao.apllyinsert(rApply);
	}
	@Override
	public RKeeper keeper(int rPJT_id) {
		return dao.getKeeper(rPJT_id);
	}
	@Override
	public RMeta meta(int rPJT_id) {
		return dao.getMeta(rPJT_id);
	}
	
}
