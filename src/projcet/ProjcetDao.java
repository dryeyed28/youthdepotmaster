package projcet;

import java.util.ArrayList;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RProject;
import vo.RewardPay;

public interface ProjcetDao {
	public void apllyinsert(RApply rApply);
	public void pjtinsert(RProject rProject);
	RKeeper getKeeper(int rPJT_id);
	RMeta getMeta(int rPJT_id);
	ArrayList<ROption> getOption(int rPJT_id);
	ArrayList<RPost> getRPost(int rPJT_id);
	public ROption getOptionPay(int rPJT_id, int reward_id);
	public RewardPay getOrderReward(int mem_id);
}
