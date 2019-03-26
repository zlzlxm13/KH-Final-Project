package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;

public class MemberDaoImp implements MemberDAO {
	private SqlSessionTemplate sqlSession;

	//

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public MemberDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.member_list");
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.member_count");
	}

	@Override
	public void insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("admin.member_insert", dto);
	}

	@Override
	public void update(MemberDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("admin.member_update", dto);
	}

	@Override
	public void delete(String[] chk) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.member_delete", chk);
	}

	@Override
	public MemberDTO content(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.member_content", dto);
	}

	@Override
	public int check(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.member_check", dto);
	}

}// end class
