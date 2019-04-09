package dto;

public class HospitalDTO {
	private int hosnum;
	private String hosname;
	private String[] petkind_kind;
	private String hosaddress;
	private String hosarea;
	private String latitude;
	private String longitude;
	
	
	
	public HospitalDTO(int hosnum, String hosname, String[] petkind_kind, String hosaddress, String hosarea,
			String latitude, String longitude) {
		super();
		this.hosnum = hosnum;
		this.hosname = hosname;
		this.petkind_kind = petkind_kind;
		this.hosaddress = hosaddress;
		this.hosarea = hosarea;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public HospitalDTO() {
		
	}

	public int getHosnum() {
		return hosnum;
	}

	public void setHosnum(int hosnum) {
		this.hosnum = hosnum;
	}

	public String getHosname() {
		return hosname;
	}

	public void setHosname(String hosname) {
		this.hosname = hosname;
	}
	


	public String[] getPetkind_kind() {
		return petkind_kind;
	}

	public void setPetkind_kind(String[] petkind_kind) {
		this.petkind_kind = petkind_kind;
	}

	public String getHosaddress() {
		return hosaddress;
	}

	public void setHosaddress(String hosaddress) {
		this.hosaddress = hosaddress;

	}

	public String getHosarea() {
		return hosarea;
	}

	public void setHosarea(String hosarea) {
		this.hosarea = hosarea;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
		
}//end class
