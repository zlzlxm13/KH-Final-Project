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
	
	
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.reservation_count");
	}

	@Override
	public List<ReservationDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.reservation_list");
	}

	@Override
	public void insert(ReservationDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.reservation_insert", dto);
	}

	@Override
	public void update(ReservationDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("admin.reservation_update", dto);
	}

	@Override
	public void delete(String[] chk) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.reservation_delete", chk);
	}

	@Override
	public ReservationDTO content(ReservationDTO dto) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("admin.reservation_content", dto);
		
	}

	@Override
	public int check(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.reservation_check", dto);
	}



}
