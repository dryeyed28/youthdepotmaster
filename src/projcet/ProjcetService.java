package projcet;

import java.util.ArrayList;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RStory;
import vo.RewardPay;

public interface ProjcetService {
	public void applyinsert(RApply rApply);
	public RKeeper keeper(int rPJT_id);
	public RMeta meta(int rPJT_id);
	public ArrayList<ROption> option(int rPJT_id);
	public ArrayList<RPost> rpost(int rPJT_id);
	public ArrayList<ROption> optionPay(int rPJT_id, int reward_id[]);
	public RewardPay orderReward(int mem_id);
	public ArrayList<RMeta> metalist();
	public ArrayList<RMeta> project();
	public ProjectContentDto content(int rPJT_id);
	public void rewardPay(RewardPay pay);
	public RStory story(int rPJT_id);
}
