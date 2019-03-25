package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PetDTO;

public class PetDAOImp implements PetDAO {
	private SqlSessionTemplate sqlSession;

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public PetDAOImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.pet_count");
	}

	@Override
	public List<PetDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.pet_list");
	}

	@Override
	public void insert(PetDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.pet_insert", dto);
	}

	@Override
	public void update(PetDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("admin.pet_update", dto);
	}

	@Override
	public void delete(String[] chk) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.pet_delete", chk);
	}

	@Override
	public PetDTO content(PetDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.pet_content", dto);
	}

	@Override
	public int check(PetDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.pet_check", dto);
	}

}
