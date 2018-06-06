package totalpay;

import java.util.ArrayList;

import vo.Deposit;
import vo.RewardPay;

public class TotalPayServiceImpl implements TotalPayService{
	TotalPayDao dao = new TotalPayDaoOracle();

	@Override
	public ArrayList<RewardPay> rewardpay() {
		return dao.getTotalPay();
	}

	@Override
	public ArrayList<Deposit> yeoljeong() {
		return dao.getDepositInfo();
	}

	@Override
	public ArrayList<Deposit> refund() {
		return dao.getRefundInfo();
	}

}
