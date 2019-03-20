package dao;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HosmapDTO;
import dto.MemDTO;

public class LoginDAOImp implements LoginDAO{
 private SqlSessionTemplate session;

 public LoginDAOImp() {}
public SqlSessionTemplate getSession() {
	return session;
}

public void setSession(SqlSessionTemplate session) {
	this.session = session;
}

// private SqlSession session;
 private static final String NameSpace="login.";
 
	@Override
	public int signUpMethod(MemDTO dto){
		 //위에 선언된 Id_Check(m)의 결과값을 Id_Check_Result에 담는다.
        int Id_Check_Result = IdChk(dto.getId());
        //Id_Check_Result값이 0이 아니라면 Id_Check_Result값을 반환
        //0은 아이디가 중복되지 않음 자세한거는 mapper를 열어보세요.
        if(Id_Check_Result != 0) 
        	return Id_Check_Result;
        
        try {
            //sqlsession에 insert를 할꺼고 내가 쓸 맵퍼는 위에 12번째줄에 선언된거고
            //내가 사용 할 QUERY문은 Register를 사용하고 넘길 값은 m이다.
            //이후 설명은 다 생략 똑같은 내용
            session.insert(NameSpace + "signup", dto);
            return 0;
        }
        catch (Exception e) {
            e.printStackTrace();
            return -2;
        }

	}

	@Override
	public int loginMethod(MemDTO dto, HttpSession Hsession) {
		
		return session.selectOne("login.signin",dto);		
	}

	@Override
	public int IdChk(String id) {		
		System.out.println("daoID:"+id);
		return session.selectOne("login.Idchk",id);
	
	}
	@Override
	public String idsearch(MemDTO dto) {
	
		return session.selectOne("login.idsearch",dto);
	}
	@Override
	public String passsearch(MemDTO dto) {
		
		return session.selectOne("login.passsearch",dto);
	}


	

}