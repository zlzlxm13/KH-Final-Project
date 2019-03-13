package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ReservationDTO;

public class ReservationDaoImp implements ReservationDAO{
	SqlSessionTemplate sqlSession;
	
	public ReservationDaoImp() {}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void ReservationInsertMethod(ReservationDTO rdto) {
		sqlSession.insert("reservation.save",rdto);
		
	}
}
