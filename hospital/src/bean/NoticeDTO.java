package bean;

public class NoticeDTO {
	private String title;
	private String name;
	private String content;
	private String time;
	private String hospital;
	private String doctor;
	private int unum;
	private String font;
	private String comment;
	private String commentName;
	private String commentTime;
	private int nonum;
	
	public int getNonum() {
		return nonum;
	}

	public void setNonum(int nonum) {
		this.nonum = nonum;
	}

	public String getCommentName() {
		return commentName;
	}

	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	@Override
	public String toString() {
		return title + "," + name + "," + content + "," + time
				+ "," + unum + "," + font + ","+comment+","+commentName+","+commentTime+",b,"+nonum;
	}
	public String toString2() {
		return title + "," + name + "," + content + "," + time
				+ "," + unum + "," + font + ","+comment+","+commentName+","+commentTime+","+doctor+","+hospital+",a,"+nonum;
	}
	
}
