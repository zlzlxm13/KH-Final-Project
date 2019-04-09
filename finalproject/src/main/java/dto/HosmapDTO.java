package dto;

public class HosmapDTO {
	private int hosnum;
	private String hosname;
	private String petkind_kind;
	private String hosaddress;
	private String hosarea;
	private String latitude;
	private String longitude;
	
	public HosmapDTO() {
		
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

	public String getPetkind_kind() {
		return petkind_kind;
	}

	public void setPetkind_kind(String petkind_kind) {
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
