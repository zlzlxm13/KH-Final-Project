package service;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dto.MemDTO;

public class LoginServiceImp implements LoginService {
	private LoginDAO ldao;

	

	public void setLdao(LoginDAO ldao) {
		this.ldao = ldao;
	}

	@Override
	public void insertMember(MemDTO dto) {
		ldao.signUpMethod(dto);

	}

	@Override
	public int idChkprocess(String id) {
		System.out.println("id:"+id);
		return ldao.IdChk(id);
	
	}

	@Override
	public int loginprocess(MemDTO dto, HttpSession Hsession) {
		
		return ldao.loginMethod(dto, Hsession);
	}

}

