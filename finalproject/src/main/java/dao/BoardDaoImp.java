package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import dto.BoardDTO;

public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate sqlSession;
	
	public BoardDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count() {
		return sqlSession.selectOne("board.boardCount");
	}

	@Override
	public List<BoardDTO> boardList(int boardkind_canum) {	/*PageDTO pv*/
		return sqlSession.selectList("board.boardList", boardkind_canum);
	}

	@Override
	public void readCount(BoardDTO bdto) {	//조회수
		sqlSession.update("board.readCount", bdto);
	}

	@Override
	public BoardDTO boardView(BoardDTO bdto) {	//게시글 화면
		return sqlSession.selectOne("board.boardView", bdto);
	}
	
	@Override
	public String catitle(int boardkind_canum) {
		return sqlSession.selectOne("board.catitle");
	}

	@Override
	public void boardInsert(BoardDTO bdto) {
		System.out.println(bdto.getBoardkind_canum());
		sqlSession.insert("board.boardInsert", bdto);
	}
	
	@Override
	public String getFile(BoardDTO bdto) {
		return sqlSession.selectOne("board.uploadFile", bdto);
	}
}