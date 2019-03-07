package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HosmapDTO;

public class HosmapDaoImp implements HosmapDAO {
	private SqlSessionTemplate sqlSession;
	
	public HosmapDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<HosmapDTO> lib_list(HashMap<String, Object> map) {
		return sqlSession.selectList("hos.hos_list", map);
	}

	@Override
	public int lib_countAll(String data) {
		return s;
	}
	
	
}//end class
