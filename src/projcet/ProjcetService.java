package projcet;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;

public interface ProjcetService {
	public void applyinsert(RApply rApply);
	public RKeeper keeper(int rPJT_id);
	public RMeta meta(int rPJT_id);
}
