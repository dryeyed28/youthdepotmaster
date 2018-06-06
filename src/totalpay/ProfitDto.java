package totalpay;

public class ProfitDto {
	private String mem_userID;
	private int rPJT_id;
	private int rPJT_progress;
	private String rPJT_endDay;
	private int rInvesting_amount;
	private int rPJT_profit;
	public ProfitDto() {
		super();
	}
	public ProfitDto(String mem_userID, int rPJT_id, int rPJT_progress, String rPJT_endDay, int rInvesting_amount,
			int rPJT_profit) {
		super();
		this.mem_userID = mem_userID;
		this.rPJT_id = rPJT_id;
		this.rPJT_progress = rPJT_progress;
		this.rPJT_endDay = rPJT_endDay;
		this.rInvesting_amount = rInvesting_amount;
		this.rPJT_profit = rPJT_profit;
	}
	public String getMem_userID() {
		return mem_userID;
	}
	public void setMem_userID(String mem_userID) {
		this.mem_userID = mem_userID;
	}
	public int getrPJT_id() {
		return rPJT_id;
	}
	public void setrPJT_id(int rPJT_id) {
		this.rPJT_id = rPJT_id;
	}
	public int getrPJT_progress() {
		return rPJT_progress;
	}
	public void setrPJT_progress(int rPJT_progress) {
		this.rPJT_progress = rPJT_progress;
	}
	public String getrPJT_endDay() {
		return rPJT_endDay;
	}
	public void setrPJT_endDay(String rPJT_endDay) {
		this.rPJT_endDay = rPJT_endDay;
	}
	public int getrInvesting_amount() {
		return rInvesting_amount;
	}
	public void setrInvesting_amount(int rInvesting_amount) {
		this.rInvesting_amount = rInvesting_amount;
	}
	public int getrPJT_profit() {
		return rPJT_profit;
	}
	public void setrPJT_profit(int rPJT_profit) {
		this.rPJT_profit = rPJT_profit;
	}
	
}
