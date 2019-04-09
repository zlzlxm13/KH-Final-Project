package dto;

import java.util.Date;

public class ReservationDTO {
	private int res_num;
	private Date res_date;
	private int hospital_hosnum;
	private String member_id;
	private String petpet;
	private String petinfo;
	private String hospital_hosname;
	
	public ReservationDTO() {
		
	}

	

	public String getHospital_hosname() {
		return hospital_hosname;
	}


	public void setHospital_hosname(String hospital_hosname) {
		this.hospital_hosname = hospital_hosname;
	}




	public String getPetinfo() {
		return petinfo;
	}

	public void setPetinfo(String petinfo) {
		this.petinfo = petinfo;
	}

	public String getPetpet() {
		return petpet;
	}

	public void setPetpet(String petpet) {
		this.petpet = petpet;
	}

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public Date getRes_date() {
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
