package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PetKindDTO;

public class PetKindDAOImp implements PetKindDAO {
	private SqlSessionTemplate sqlSession;

	public PetKindDAOImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.petkind_count");
	}

	@Override
	public List<PetKindDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.petkind_list");
	}

	@Override
	public void insert(PetKindDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.petkind_insert", dto);
	}

	@Override
	public void update(PetKindDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("admin.petkind_update", dto);
	}

	@Override
	public void delete(String[] chk) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.petkind_delete", chk);
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int content(PetKindDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.petkind_content", dto);
	}

	

}
