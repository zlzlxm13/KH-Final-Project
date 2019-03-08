package dao;

import java.security.spec.ECFieldF2m;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import dto.MemDTO;
import static jdbc.JdbcTemplate.close;
import static jdbc.JdbcTemplate.commit;
import static jdbc.JdbcTemplate.getConnection;
import static jdbc.JdbcTemplate.rollback;

public class LoginDAOImp implements LoginDAO{
 private SqlSessionTemplate session;
 



public void setSession(SqlSessionTemplate session) {
	this.session = session;
}

Connection conn = getConnection();
	@Override
	public void signUpMethod(MemDTO dto) {
	session.insert("login.signup",dto);
	}
	
	
	
	
	@Override
	public int loginMethod(MemDTO dto, HttpSession Hsession) {
		  int Id_Search_Result = -1;
	        try {
	            Id_Search_Result = session.selectOne("login.signin", dto);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	        
	        if(Id_Search_Result != 1) return Id_Search_Result;
	        
	        try {
	            MemDTO m_info = session.selectOne("login.Login_Info", dto);
	            Hsession.setAttribute("dto", m_info);
	            return 1;
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	            return -2;
	        }

	}

	@Override
	public int idChk(String id) {
		return session.selectOne("login.Idchk",id);
	}//end IdChk()

	
}