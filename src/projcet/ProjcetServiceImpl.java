package projcet;

import java.util.ArrayList;

import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RewardPay;

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
	@Override
	public ArrayList<ROption> option(int rPJT_id) {
		return dao.getOption(rPJT_id);
	}
	@Override
	public ArrayList<RPost> rpost(int rPJT_id) {
		return dao.getRPost(rPJT_id);
	}
	@Override
	public ROption optionPay(int rPJT_id, int reward_id) {
		return dao.getOptionPay(rPJT_id, reward_id);
	}
	@Override
	public RewardPay orderReward(int mem_id) {
		return dao.getOrderReward(mem_id);
	}
	@Override
	public ArrayList<RMeta> metalist() {
		return dao.getMetaList();
	}
	
}
