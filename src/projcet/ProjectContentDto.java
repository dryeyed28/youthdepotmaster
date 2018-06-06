package projcet;

public class ProjectContentDto {
	private int rPjt_id;
	private String pjt_title;
	private int target_amount;
	private String pjt_category;
	private String pjt_subtitle;
	private String pjt_story;
	private String pjt_thumnail;
	private String pjt_paper;
	private String pjt_url;
	public ProjectContentDto() {
		super();
	}
	public ProjectContentDto(int rPjt_id, String pjt_title, int target_amount, String pjt_category, String pjt_subtitle,
			String pjt_story, String pjt_thumnail, String pjt_paper, String pjt_url) {
		super();
		this.rPjt_id = rPjt_id;
		this.pjt_title = pjt_title;
		this.target_amount = target_amount;
		this.pjt_category = pjt_category;
		this.pjt_subtitle = pjt_subtitle;
		this.pjt_story = pjt_story;
		this.pjt_thumnail = pjt_thumnail;
		this.pjt_paper = pjt_paper;
		this.pjt_url = pjt_url;
	}
	public int getrPjt_id() {
		return rPjt_id;
	}
	public void setrPjt_id(int rPjt_id) {
		this.rPjt_id = rPjt_id;
	}
	public String getPjt_title() {
		return pjt_title;
	}
	public void setPjt_title(String pjt_title) {
		this.pjt_title = pjt_title;
	}
	public int getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}
	public String getPjt_category() {
		return pjt_category;
	}
	public void setPjt_category(String pjt_category) {
		this.pjt_category = pjt_category;
	}
	public String getPjt_subtitle() {
		return pjt_subtitle;
	}
	public void setPjt_subtitle(String pjt_subtitle) {
		this.pjt_subtitle = pjt_subtitle;
	}
	public String getPjt_story() {
		return pjt_story;
	}
	public void setPjt_story(String pjt_story) {
		this.pjt_story = pjt_story;
	}
	public String getPjt_thumnail() {
		return pjt_thumnail;
	}
	public void setPjt_thumnail(String pjt_thumnail) {
		this.pjt_thumnail = pjt_thumnail;
	}
	public String getPjt_paper() {
		return pjt_paper;
	}
	public void setPjt_paper(String pjt_paper) {
		this.pjt_paper = pjt_paper;
	}
	public String getPjt_url() {
		return pjt_url;
	}
	public void setPjt_url(String pjt_url) {
		this.pjt_url = pjt_url;
	}
	
	
	
}
