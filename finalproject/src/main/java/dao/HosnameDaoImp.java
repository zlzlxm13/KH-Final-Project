package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.HosnameDTO;
import dto.HospitalDTO;

public class HosnameDaoImp implements HosnameDAO {
	private SqlSessionTemplate sqlSession;

	//

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public HosnameDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<HosnameDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.hosname_list");
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hosname_count");
	}

	@Override
	public void insert(HosnameDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.hosname_insert", dto);
	}

	@Override
	public void delete(HosnameDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.hosname_delete", dto);
	}

	@Override
	public HosnameDTO content(HosnameDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hosname_content", dto);
	}

	@Override
	public int check(HosnameDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.hosname_check", dto);
	}

	@Override
	public void hosdelete(int hosnum) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.hosname_hosdelete", hosnum);
	}
	

}// end class
