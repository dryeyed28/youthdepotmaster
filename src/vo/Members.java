package vo;

import java.util.Date;

public class Members {
	private int mem_id;
	private String mem_userID;
	private String mem_email;
	private String mem_password;
	private String mem_username;
	private String mem_nickName;
	private String mem_phone;
	private int mem_sex;
	private Date mem_register_dateTime;
	private Date mem_lastLogin_dateTime;
	private int mem_keeper;
	private int mem_passion;
	public Members() {
		super();
	}
	public Members(int mem_id, String mem_userID, String mem_email, String mem_password, String mem_username,
			String mem_nickName, String mem_phone, int mem_sex, Date mem_register_dateTime, Date mem_lastLogin_dateTime,
			int mem_treasurer, int mem_passion) {
		super();
		this.mem_id = mem_id;
		this.mem_userID = mem_userID;
		this.mem_email = mem_email;
		this.mem_password = mem_password;
		this.mem_username = mem_username;
		this.mem_nickName = mem_nickName;
		this.mem_phone = mem_phone;
		this.mem_sex = mem_sex;
		this.mem_register_dateTime = mem_register_dateTime;
		this.mem_lastLogin_dateTime = mem_lastLogin_dateTime;
		this.mem_keeper = mem_treasurer;
		this.mem_passion = mem_passion;
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
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_username() {
		return mem_username;
	}
	public void setMem_username(String mem_username) {
		this.mem_username = mem_username;
	}
	public String getMem_nickName() {
		return mem_nickName;
	}
	public void setMem_nickName(String mem_nickName) {
		this.mem_nickName = mem_nickName;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public int getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(int mem_sex) {
		this.mem_sex = mem_sex;
	}
	public Date getMem_register_dateTime() {
		return mem_register_dateTime;
	}
	public void setMem_register_dateTime(Date mem_register_dateTime) {
		this.mem_register_dateTime = mem_register_dateTime;
	}
	public Date getMem_lastLogin_dateTime() {
		return mem_lastLogin_dateTime;
	}
	public void setMem_lastLogin_dateTime(Date mem_lastLogin_dateTime) {
		this.mem_lastLogin_dateTime = mem_lastLogin_dateTime;
	}
	public int getMem_treasurer() {
		return mem_keeper;
	}
	public void setMem_treasurer(int mem_treasurer) {
		this.mem_keeper = mem_treasurer;
	}
	public int getMem_passion() {
		return mem_passion;
	}
	public void setMem_passion(int mem_passion) {
		this.mem_passion = mem_passion;
	}
		
}
