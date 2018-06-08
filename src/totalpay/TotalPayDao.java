package totalpay;

import java.util.ArrayList;

import vo.Deposit;
import vo.RewardPay;

public interface TotalPayDao {

	ArrayList<RewardPay> getTotalPay();
	ArrayList<Deposit> getDepositInfo();
	ArrayList<Deposit> getRefundInfo();
	ArrayList<ProfitDto> getgetProfit();
	void getRefundOK(int dep, int id);
}
