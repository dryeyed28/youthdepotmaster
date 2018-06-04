package vo;

public class RewardPay {
	private int rPay_id;
	private int mem_id;
	private String mem_name;
	private int rPJT_id;
	private int rProduct_id;
	private int rProduct_ea;
	private int rAddPay;
	private String rPay_address;
	private String rPay_phone;
	private String rPay_request;
	private int rPay_total;
	public RewardPay() {
		super();
	}
	public RewardPay(int rPay_id, int mem_id, String mem_name, int rPJT_id, int rProduct_id, int rProduct_ea,
			int rAddPay, String rPay_address, String rPay_phone, String rPay_request, int rPay_total) {
		super();
		this.rPay_id = rPay_id;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.rPJT_id = rPJT_id;
		this.rProduct_id = rProduct_id;
		this.rProduct_ea = rProduct_ea;
		this.rAddPay = rAddPay;
		this.rPay_address = rPay_address;
		this.rPay_phone = rPay_phone;
		this.rPay_request = rPay_request;
		this.rPay_total = rPay_total;
	}
	public int getrPay_id() {
		return rPay_id;
	}
	public void setrPay_id(int rPay_id) {
		this.rPay_id = rPay_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getrPJT_id() {
		return rPJT_id;
	}
	public void setrPJT_id(int rPJT_id) {
		this.rPJT_id = rPJT_id;
	}
	public int getrProduct_id() {
		return rProduct_id;
	}
	public void setrProduct_id(int rProduct_id) {
		this.rProduct_id = rProduct_id;
	}
	public int getrProduct_ea() {
		return rProduct_ea;
	}
	public void setrProduct_ea(int rProduct_ea) {
		this.rProduct_ea = rProduct_ea;
	}
	public int getrAddPay() {
		return rAddPay;
	}
	public void setrAddPay(int rAddPay) {
		this.rAddPay = rAddPay;
	}
	public String getrPay_address() {
		return rPay_address;
	}
	public void setrPay_address(String rPay_address) {
		this.rPay_address = rPay_address;
	}
	public String getrPay_phone() {
		return rPay_phone;
	}
	public void setrPay_phone(String rPay_phone) {
		this.rPay_phone = rPay_phone;
	}
	public String getrPay_request() {
		return rPay_request;
	}
	public void setrPay_request(String rPay_request) {
		this.rPay_request = rPay_request;
	}
	public int getrPay_total() {
		return rPay_total;
	}
	public void setrPay_total(int rPay_total) {
		this.rPay_total = rPay_total;
	}
	
}
