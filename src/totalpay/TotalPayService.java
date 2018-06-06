package totalpay;

import java.util.ArrayList;

import vo.Deposit;
import vo.RewardPay;

public interface TotalPayService {

	ArrayList<RewardPay> rewardpay();
	ArrayList<Deposit> yeoljeong();
	ArrayList<Deposit> refund();
	ArrayList<ProfitDto> profit();
}
