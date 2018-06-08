package projcet;

import java.util.ArrayList;

import vo.Member;
import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RProject;
import vo.RStory;
import vo.RewardPay;

public interface ProjcetDao {
	public void apllyinsert(RApply rApply);
	public void pjtinsert(RProject rProject);
	RKeeper getKeeper(int rPJT_id);
	RMeta getMeta(int rPJT_id);
	ArrayList<ROption> getOption(int rPJT_id);
	ArrayList<RPost> getRPost(int rPJT_id);
	public RewardPay getOrderReward(int mem_id);
	public ArrayList<RMeta> getMetaList();
	public ArrayList<RMeta> getProjectRequest();
	public ProjectContentDto getProjectContent(int rPJT_id);
	public void getrewardPay(RewardPay pay);
	public RStory getStory(int rPJT_id);
	public Member getMemPay(int mem_id);
}
