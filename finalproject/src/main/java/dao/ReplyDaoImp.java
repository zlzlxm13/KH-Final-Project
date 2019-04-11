package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ReplyDTO;

public class ReplyDaoImp implements ReplyDAO{
	private SqlSessionTemplate sqlSession;
	
	public ReplyDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int count(ReplyDTO rdto) {
		return sqlSession.selectOne("reply.replyCount", rdto);
	}
	
	@Override
	public List<ReplyDTO> replyList(ReplyDTO rdto) {
		return sqlSession.selectList("reply.replyList", rdto);
	}
	
	@Override
	public void replyInsert(ReplyDTO rdto) {
		sqlSession.insert("reply.replyInsert", rdto);
	}
	
	@Override
	public ReplyDTO replyUpdateStart(ReplyDTO rdto) {
		return sqlSession.selectOne("reply.replyUpdateStart", rdto);
	}
	
	@Override
	public void replyUpdate(ReplyDTO rdto) {
		sqlSession.update("reply.replyUpdate", rdto);
	}
	
	@Override
	public void decreaseRnum(ReplyDTO rdto) {
		sqlSession.update("reply.decreaseRnum", rdto);	
	}
	
	@Override
	public void replyDelete(ReplyDTO rdto) {
		sqlSession.delete("reply.replyDelete", rdto);
	}
	
	@Override
	public String getFile(ReplyDTO rdto) {
		return sqlSession.selectOne("reply.uploadFile", rdto);
	}
}