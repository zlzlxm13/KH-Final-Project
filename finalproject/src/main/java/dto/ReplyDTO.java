package dto;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class ReplyDTO {
	private int boardkind_canum, bnum, rnum;
	private String member_id, rcontent;
	private Date reg_date;
	private String rpath;
	private MultipartFile filename;

	public ReplyDTO() {
		
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

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getRpath() {
		return rpath;
	}

	public void setRpath(String rpath) {
		this.rpath = rpath;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
}