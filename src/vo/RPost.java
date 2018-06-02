package vo;


public class RPost {
	private RProject rProject;
	private String rPost_title;
	private String rPost_content;
	private String rPost_userID;
	private String rPost_dateTime;
	public RPost() {
		super();
	}
	public RPost(RProject rProject, String rPost_title, String rPost_content, String rPost_userID,
			String rPost_dateTime) {
		super();
		this.rProject = rProject;
		this.rPost_title = rPost_title;
		this.rPost_content = rPost_content;
		this.rPost_userID = rPost_userID;
		this.rPost_dateTime = rPost_dateTime;
	}
	public RProject getrProject() {
		return rProject;
	}
	public void setrProject(RProject rProject) {
		this.rProject = rProject;
	}
	public String getrPost_title() {
		return rPost_title;
	}
	public void setrPost_title(String rPost_title) {
		this.rPost_title = rPost_title;
	}
	public String getrPost_content() {
		return rPost_content;
	}
	public void setrPost_content(String rPost_content) {
		this.rPost_content = rPost_content;
	}
	public String getrPost_userID() {
		return rPost_userID;
	}
	public void setrPost_userID(String rPost_userID) {
		this.rPost_userID = rPost_userID;
	}
	public String getrPost_dateTime() {
		return rPost_dateTime;
	}
	public void setrPost_dateTime(String rPost_dateTime) {
		this.rPost_dateTime = rPost_dateTime;
	}
	
}
