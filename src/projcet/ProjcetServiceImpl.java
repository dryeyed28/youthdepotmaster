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
	public ArrayList<ROption> optionPay(int rPJT_id, int reward_id[]) {
		ArrayList<ROption> list = dao.getOption(rPJT_id);
		ArrayList<ROption> payadress = new ArrayList<ROption>();
		for (int i = 0; i < reward_id.length; i++) {
			for (int j = 0; j < list.size(); j++) {
				if (reward_id[i] == list.get(j).getReward_id()) {
					payadress.add(list.get(j));
				}
			}
		}
		return payadress;
	}
	@Override
	public RewardPay orderReward(int mem_id) {
		return dao.getOrderReward(mem_id);
	}
	@Override
	public ArrayList<RMeta> metalist() {
		return dao.getMetaList();
	}
	@Override
	public ArrayList<RMeta> project() {
		return dao.getProjectRequest();
	}
	
}
