package dto;

public class HosmapDTO {
	private int hosNum;
	private String hosName;
	private String hosLocation;
	private String petKind_kind;
	
	public HosmapDTO() {
		
	}
	
	public int getHosNum() {
		return hosNum;
	}
	
	public void setHosNum(int hosNum) {
		this.hosNum = hosNum;
	}
	
	public String getHosName() {
		return hosName;
	}
	
	public void setHosName(String hosName) {
		this.hosName = hosName;
	}
	public String getHosLocation() {
		return hosLocation;
	}
	
	public void setHosLocation(String hosLocation) {
		this.hosLocation = hosLocation;
	}
	
	public String getPetKind_kind() {
		return petKind_kind;
	}
	
	public void setPetKind_kind(String petKind_kind) {
		this.petKind_kind = petKind_kind;
	}
		
}//end class
