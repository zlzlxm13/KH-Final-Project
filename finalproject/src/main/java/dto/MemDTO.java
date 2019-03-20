package dto;

public class MemDTO {
	private String id;
	private String pass;
	private String name;
	private String grade;
	private String phonenum;
	private String email;

	private String user_authCode;
	private String user_email;
	

	public MemDTO() {
		
	}
	public String getUser_authCode() {
		return user_authCode;
	}

	public void setUser_authCode(String user_authCode) {
		this.user_authCode = user_authCode;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = email;
	}
	
	

}
