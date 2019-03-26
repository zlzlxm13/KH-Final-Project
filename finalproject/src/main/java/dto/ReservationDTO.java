package dto;

import java.util.Date;

public class ReservationDTO {

	private int res_num;
	private Date res_date;
	private int hospital_hosnum;
	private String member_id;
	
	
	public ReservationDTO() {
		
	}
	
	public ReservationDTO(int res_num, Date res_date, int hospital_hosnum, String member_id) {
		super();
		this.res_num = res_num;
		this.res_date = res_date;
		this.hospital_hosnum = hospital_hosnum;
		this.member_id = member_id;
	}

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public java.util.Date getRes_date() {
		return res_date;
	}

	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}

	public int getHospital_hosnum() {
		return hospital_hosnum;
	}

	public void setHospital_hosnum(int hospital_hosnum) {
		this.hospital_hosnum = hospital_hosnum;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	
	
}
