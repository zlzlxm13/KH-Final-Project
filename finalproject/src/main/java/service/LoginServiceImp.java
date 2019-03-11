package service;

import java.sql.ResultSet;
import java.sql.SQLException;

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
		return ldao.idChk(id);
	
	}

	
}
