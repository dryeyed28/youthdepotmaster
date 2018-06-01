package projcet;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;

public interface ProjcetDao {
	public void apllyinsert(RApply rApply);
	RKeeper getKeeper(int rPJT_id);
	RMeta getMeta(int rPJT_id);
}
