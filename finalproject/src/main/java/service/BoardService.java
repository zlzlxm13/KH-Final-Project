package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;

public interface BoardService {
	public int countProcess(); 
	public List<BoardDTO> listProcess(int boardkind_canum);
	public String catitle(int boardkind_canum);
	public void insertProcess(BoardDTO bdto);
	public BoardDTO viewProcess(BoardDTO bdto);
	public BoardDTO updateSelectProcess(BoardDTO bdto);
}//end interface