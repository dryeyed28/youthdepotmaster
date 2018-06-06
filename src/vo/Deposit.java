package vo;


public class Deposit {
	private int dep_id;
	private int mem_id;
	private String mem_userID;
	/*dep_type 1.충전  2.사용  3.환급대기 4.환급완료*/
	private int dep_type;
	private int dep_request;
	private int dep_balance;
	private String dep_date;
	/*dep_state 1.입금대기 2.입금완료 3.입금취소 
	 * 충전일 경우에만 dep_state 값 insert 해주기*/
	private int dep_state;
	public Deposit() {
		super();
	}
	public Deposit(int dep_id, int mem_id, String mem_userID, int dep_type, int dep_request, int dep_balance,
			String dep_date, int dep_state) {
		super();
		this.dep_id = dep_id;
		this.mem_id = mem_id;
		this.mem_userID = mem_userID;
		this.dep_type = dep_type;
		this.dep_request = dep_request;
		this.dep_balance = dep_balance;
		this.dep_date = dep_date;
		this.dep_state = dep_state;
	}
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_userID() {
		return mem_userID;
	}
	public void setMem_userID(String mem_userID) {
		this.mem_userID = mem_userID;
	}
	public int getDep_type() {
		return dep_type;
	}
	public void setDep_type(int dep_type) {
		this.dep_type = dep_type;
	}
	public int getDep_request() {
		return dep_request;
	}
	public void setDep_request(int dep_request) {
		this.dep_request = dep_request;
	}
	public int getDep_balance() {
		return dep_balance;
	}
	public void setDep_balance(int dep_balance) {
		this.dep_balance = dep_balance;
	}
	public String getDep_date() {
		return dep_date;
	}
	public void setDep_date(String dep_date) {
		this.dep_date = dep_date;
	}
	public int getDep_state() {
		return dep_state;
	}
	public void setDep_state(int dep_state) {
		this.dep_state = dep_state;
	}
	
}
