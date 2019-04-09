package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HosmapDTO;
import dto.HospitalDTO;



public class HospitalDaoImp implements HospitalDAO {
	private SqlSessionTemplate sqlSession;

	//
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}


	public HospitalDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public List<HosmapDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.hospital_list");
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hospital_count");
	}

	@Override
	public void insert(HospitalDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.hospital_insert", dto);
	}

	@Override
	public void update(HosmapDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("admin.hospital_update", dto);
	}

	@Override
	public void delete(String[] chk) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.hospital_delete", chk);
	}

	@Override
	public HosmapDTO content(HosmapDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hospital_content", dto);
	}

	@Override
	public int check(HosmapDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hospital_check", dto);
	}


	@Override
	public int hos_seq() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hospital_seq");

	}

	
}//end class
