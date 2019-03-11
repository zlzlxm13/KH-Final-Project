package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.MemDTO;

public interface LoginDAO {
	public void signUpMethod(MemDTO dto);
	
	 public int loginMethod(MemDTO dto, HttpSession Hsession);


public int idChk(String id);

}
