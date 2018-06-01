package projcet;

import java.util.ArrayList;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;

public interface ProjcetService {
	public void applyinsert(RApply rApply);
	public RKeeper keeper(int rPJT_id);
	public RMeta meta(int rPJT_id);
	public ArrayList<ROption> option(int rPJT_id);
}
