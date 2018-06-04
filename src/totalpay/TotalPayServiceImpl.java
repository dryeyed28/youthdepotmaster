package totalpay;

import java.util.ArrayList;

import vo.RewardPay;

public class TotalPayServiceImpl implements TotalPayService{
	TotalPayDao dao = new TotalPayDaoOracle();

	@Override
	public ArrayList<RewardPay> rewardpay() {
		return dao.getTotalPay();
	}

}
