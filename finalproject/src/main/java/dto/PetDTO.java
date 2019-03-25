package dto;

public class PetDTO {
	private String petname;
	private String petage;
	private String petsex;
	private String member_id;
	private String petinfo;
	private String petkind_kind;
	private String petnum;
	
	public String getPetnum() {
		return petnum;
	}
	public void setPetnum(String petnum) {
		this.petnum = petnum;
	}
	public PetDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getPetage() {
		return petage;
	}
	public void setPetage(String petage) {
		this.petage = petage;
	}
	public String getPetsex() {
		return petsex;
	}
	public void setPetsex(String petsex) {
		this.petsex = petsex;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPetinfo() {
		return petinfo;
	}
	public void setPetinfo(String petinfo) {
		this.petinfo = petinfo;
	}
	public String getPetkind_kind() {
		return petkind_kind;
	}
	public void setPetkind_kind(String petkind_kind) {
		this.petkind_kind = petkind_kind;
	}
	
	
}
