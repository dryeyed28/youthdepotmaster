package projcet;

import java.util.ArrayList;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;

public interface ProjcetDao {
	public void apllyinsert(RApply rApply);
	RKeeper getKeeper(int rPJT_id);
	RMeta getMeta(int rPJT_id);
	ArrayList<ROption> getOption(int rPJT_id);
}
