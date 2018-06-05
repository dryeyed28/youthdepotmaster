package vo;

public class Board {
	private int brd_id;
	private String brd_name;
	private String brd_type;
	private int brd_count;
	public Board() {
		super();
	}
	public Board(int brd_id, String brd_name, String brd_type, int brd_count) {
		super();
		this.brd_id = brd_id;
		this.brd_name = brd_name;
		this.brd_type = brd_type;
		this.brd_count = brd_count;
	}
	public int getBrd_id() {
		return brd_id;
	}
	public void setBrd_id(int brd_id) {
		this.brd_id = brd_id;
	}
	public String getBrd_name() {
		return brd_name;
	}
	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}
	public String getBrd_type() {
		return brd_type;
	}
	public void setBrd_type(String brd_type) {
		this.brd_type = brd_type;
	}
	public int getBrd_count() {
		return brd_count;
	}
	public void setBrd_count(int brd_count) {
		this.brd_count = brd_count;
	}
	
	@Override
	public String toString() {
		return "Board [brd_id=" + brd_id + ", brd_name=" + brd_name + ", brd_type=" + brd_type + ", brd_count="
				+ brd_count + "]";
	}		
}
