package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HosmapDTO;
import dto.HosmapDTO;

public class HosmapDaoImp implements HosmapDAO {
	private SqlSessionTemplate sqlSession;

	//
	public HosmapDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<HosmapDTO> hos_list(HashMap<String, Object> map) {
		return sqlSession.selectList("hos.hos_list", map);
	}

	@Override
	public int hos_countAll(String data) {
		return sqlSession.selectOne("hos.hos_countAll", data);
	}


	
}//end class
