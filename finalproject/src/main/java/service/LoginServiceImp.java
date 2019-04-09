
    
package service;

import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;


import dao.LoginDAO;
import dto.MemDTO;
import mail.MailHandler;
import mail.TempKey;

public class LoginServiceImp implements LoginService {
	private LoginDAO ldao;

	@Autowired
	private JavaMailSender mailSender;	

	

	public void setLdao(LoginDAO ldao) {
		this.ldao = ldao;
	}

	@Override
	public void insertMember(MemDTO dto){
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


	@Override
	public String idsearchprocess(MemDTO dto) {
		// TODO Auto-generated method stub
		return ldao.idsearch(dto);
	}

	@Override
	public String passearchprocess(MemDTO dto) {
	
		return ldao.passsearch(dto);
	}

	@Override
	public int emailChkprocess(String email) {
		
		return ldao.emailChk(email);
	}

	@Override
	public MemDTO signloginprocess(MemDTO dto) {
	
		return ldao.signin(dto);
	}


}

