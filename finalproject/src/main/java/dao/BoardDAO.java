package dao;

import java.util.List;

import dto.BoardDTO;

public interface BoardDAO {
	public int count();
	public List<BoardDTO> boardList(int boardkind_canum);
	public void readCount(BoardDTO bdto);
	public BoardDTO boardView(BoardDTO bdto);
	public String catitle(int boardkind_canum);
	public void boardInsert(BoardDTO bdto);
	public String getFile(BoardDTO bdto);
}
