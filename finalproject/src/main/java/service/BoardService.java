package service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import dto.BoardDTO;
import dto.BoardkindDTO;

public interface BoardService {
	public int count(int boardkind_canum); 
	public List<BoardDTO> boardList(int boardkind_canum);
	public List<BoardkindDTO> catitle(int boardkind_canum);
	public void boardInsert(BoardDTO bdto);
	public BoardDTO boardUpdateSelect(BoardDTO bdto);
	public void boardUpdate(BoardDTO bdto, HttpServletRequest request);
	public void boardDelete(BoardDTO bdto);
	public BoardDTO boardView(BoardDTO bdto);
	public void replyCount(BoardDTO bdto);
}//end interface