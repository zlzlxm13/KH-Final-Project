package dao;

import java.util.List;

import dto.BoardDTO;
import dto.BoardkindDTO;
import dto.PageDTO;

public interface BoardDAO {
	public int count(int boardkind_canum);
	public List<BoardDTO> boardList(PageDTO pdto);
	public void readCount(BoardDTO bdto);
	public BoardDTO boardView(BoardDTO bdto);
	public List<BoardkindDTO> catitle(int boardkind_canum);
	public void boardInsert(BoardDTO bdto);
	public void boardUpdate(BoardDTO bdto);
	public void boardDelete(BoardDTO bdto);
	public void replyCount(BoardDTO bdto);
	public String getFile(BoardDTO bdto);
}
