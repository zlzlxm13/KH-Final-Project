package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HospitalDTO;

public class HospitalDAOImp implements HospitalDAO{
	private SqlSessionTemplate sqlSession;

	public HospitalDAOImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hospital.count");
	}

	@Override
	public HospitalDTO List(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(HospitalDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
