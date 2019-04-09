package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int boardkind_canum, bnum;
	private String btitle, bcontent;
	private Date reg_date;
	private int readcount;
	private String member_id;
	private String bpath;		// board
	private int col;
	private MultipartFile filename;	// form
	
	public BoardDTO() {
	
	}

	public int getBoardkind_canum() {
		return boardkind_canum;
	}

	public void setBoardkind_canum(int boardkind_canum) {
		this.boardkind_canum = boardkind_canum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getBpath() {
		return bpath;
	}

	public void setBpath(String bpath) {
		this.bpath = bpath;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
}// end class