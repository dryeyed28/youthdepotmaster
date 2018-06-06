package vo;


public class RProject {
	private int rPJT_id;
	private int mem_id;
	/*rPJT_state 1.검토중  2.승인  3.반려*/
	private int rPJT_state;
	/*rPJT_progress 1.진행  2.성공 3.실패 4.대기*/
	private int rPJT_progress;
	private String rPJT_submission;
	/*rPJT_profit 1.입금완료 2.입금대기 3.-*/
	private int rPJT_profit;
	public RProject() {
		super();
	}
	public RProject(int rPJT_id, int mem_id, int rPJT_state, int rPJT_progress, String rPJT_submission,
			int rPJT_profit) {
		super();
		this.rPJT_id = rPJT_id;
		this.mem_id = mem_id;
		this.rPJT_state = rPJT_state;
		this.rPJT_progress = rPJT_progress;
		this.rPJT_submission = rPJT_submission;
		this.rPJT_profit = rPJT_profit;
	}
	public int getrPJT_id() {
		return rPJT_id;
	}
	public void setrPJT_id(int rPJT_id) {
		this.rPJT_id = rPJT_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public int getrPJT_state() {
		return rPJT_state;
	}
	public void setrPJT_state(int rPJT_state) {
		this.rPJT_state = rPJT_state;
	}
	public int getrPJT_progress() {
		return rPJT_progress;
	}
	public void setrPJT_progress(int rPJT_progress) {
		this.rPJT_progress = rPJT_progress;
	}
	public String getrPJT_submission() {
		return rPJT_submission;
	}
	public void setrPJT_submission(String rPJT_submission) {
		this.rPJT_submission = rPJT_submission;
	}
	public int getrPJT_profit() {
		return rPJT_profit;
	}
	public void setrPJT_profit(int rPJT_profit) {
		this.rPJT_profit = rPJT_profit;
	}
	
}
