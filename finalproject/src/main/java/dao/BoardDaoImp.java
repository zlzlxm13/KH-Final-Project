package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import dto.BoardDTO;
import dto.BoardkindDTO;
import dto.PageDTO;

public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate sqlSession;
	
	public BoardDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count(int boardkind_canum) {
		return sqlSession.selectOne("board.boardCount", boardkind_canum);
	}

	@Override
	public List<BoardDTO> boardList(PageDTO pdto) {	/*PageDTO pv*/
		return sqlSession.selectList("board.boardList", pdto);
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
	public List<BoardkindDTO> catitle(int boardkind_canum) {
		return sqlSession.selectList("board.catitle", boardkind_canum);
	}

	@Override
	public void boardInsert(BoardDTO bdto) {
		sqlSession.insert("board.boardInsert", bdto);
	}
	
	@Override
	public void boardUpdate(BoardDTO bdto) {
		sqlSession.update("board.boardUpdate", bdto);	
	}
	
	@Override
	public void boardDelete(BoardDTO bdto) {
		sqlSession.delete("board.boardDelete", bdto);
	}
	
	@Override
	public void replyCount(BoardDTO bdto) {
		sqlSession.update("board.replyCount", bdto);
	}
	
	@Override
	public String getFile(BoardDTO bdto) {
		return sqlSession.selectOne("board.uploadFile", bdto);
	}
}