package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.MemDTO;

public interface LoginDAO {

	public int signUpMethod(MemDTO dto);
	
	 public int loginMethod(MemDTO dto, HttpSession Hsession);

public int IdChk(String id);

}
