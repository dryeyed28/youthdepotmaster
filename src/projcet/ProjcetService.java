package projcet;

import vo.RApply;
import vo.RKeeper;

public interface ProjcetService {
	public void applyinsert(RApply rApply);
	public RKeeper keeper(int rPJT_id);
}
