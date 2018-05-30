package post;

public class Post {
	private int seq;
	private int boardid;
	private String id;
	private String nickName;
	private String title;
	private String content;
	private String dateTime;
	private int viewCount;
	private int delete;
	
	public Post() {
		super();
	}

	public Post(int seq, int boardid, String id, String nickName, String title, String content, String dateTime,
			int viewCount, int delete) {
		super();
		this.seq = seq;
		this.boardid = boardid;
		this.id = id;
		this.nickName = nickName;
		this.title = title;
		this.content = content;
		this.dateTime = dateTime;
		this.viewCount = viewCount;
		this.delete = delete;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getDelete() {
		return delete;
	}

	public void setDelete(int delete) {
		this.delete = delete;
	}
	
	


}
