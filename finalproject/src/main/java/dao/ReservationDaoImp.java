package dao;

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
	public List<ReservationDTO> r_search(String member_id) {
		return sqlSession.selectList("reservation.r_search",member_id);
	}


	@Override
	public void r_delete(int num) {
		sqlSession.delete("reservation.r_delete",num);
		
	}



}
