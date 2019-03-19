package dao;

<<<<<<< HEAD
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ReservationDTO;

public class ReservationDaoImp implements ReservationDAO{
	SqlSessionTemplate sqlSession;
	
	public ReservationDaoImp() {}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	@Override
	public void ReservationInsertMethod(ReservationDTO rdto) {
		sqlSession.insert("reservation.save",rdto);
		
	}
=======
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import dto.ReservationDTO;

public class ReservationDaoImp implements ReservationDAO{
	SqlSessionTemplate sqlSession;
	
	public ReservationDaoImp() {}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void save(ReservationDTO dto) {
		
		sqlSession.insert("reservation.save", dto);
		
	}

	@Override
	public List<ReservationDTO> search(String member_id) {
		return sqlSession.selectList("reservation.search",member_id);
	}

	@Override
	public List<ReservationDTO> r_list() {
		return sqlSession.selectList("reservation.r_list");
	}

	@Override
	public void r_delete(int num) {
		sqlSession.delete("reservation.r_delete",num);
		
	}


>>>>>>> branch 'testbranch' of https://github.com/zlzlxm13/KH-Final-Project
}
