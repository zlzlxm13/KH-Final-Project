package dto;

public class HosnameDTO {
	private int hosnum;
	private String petkind_kind;

	
	public HosnameDTO(int hosnum, String petkind_kind) {
		super();
		this.hosnum = hosnum;
		this.petkind_kind = petkind_kind;
	}
	public HosnameDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getHosnum() {
		return hosnum;
	}
	public void setHosnum(int hosnum) {
		this.hosnum = hosnum;
	}
	public String getPetkind_kind() {
		return petkind_kind;
	}
	public void setPetkind_kind(String petkind_kind) {
		this.petkind_kind = petkind_kind;
	}
			
}//end class
