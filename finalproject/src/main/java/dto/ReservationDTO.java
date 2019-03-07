package dto;

import java.sql.Date;

public class ReservationDTO {

	private int res_num;
	private Date res_date;
	private HospitalDTO HosPital;
	private MemDTO member;
	
	public ReservationDTO() {
		
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

	public HospitalDTO getHosPital() {
		return HosPital;
	}

	public void setHosPital(HospitalDTO hosPital) {
		HosPital = hosPital;
	}

	public MemDTO getMember() {
		return member;
	}

	public void setMember(MemDTO member) {
		this.member = member;
	}
	
	
	
}
