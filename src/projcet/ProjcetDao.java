package projcet;

import vo.RApply;
import vo.RKeeper;

public interface ProjcetDao {
	public void apllyinsert(RApply rApply);
	RKeeper getKeeper(int rPJT_id);
}
