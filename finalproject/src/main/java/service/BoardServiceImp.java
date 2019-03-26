package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import dao.BoardDAO;
import dto.BoardDTO;

public class BoardServiceImp implements BoardService{
	private BoardDAO bdao;

	public BoardServiceImp() {
		
	}
	
	public void setBdao(BoardDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	public int countProcess() {
		return bdao.count();
	}

	@Override
	public List<BoardDTO> listProcess(int boardkind_canum/*PageDTO pv*/) {
		return bdao.boardList(boardkind_canum);
	}

	@Override
	public String catitle(int boardkind_canum) {
		return bdao.catitle(boardkind_canum);
	}
	
	@Override
	public void insertProcess(BoardDTO bdto) {
		bdao.boardInsert(bdto);
	}

	@Override
	public BoardDTO viewProcess(BoardDTO bdto) {
		bdao.readCount(bdto);
		return bdao.boardView(bdto);
	}

	@Override
	public BoardDTO updateSelectProcess(BoardDTO bdto) {
		return bdao.boardView(bdto);
	}
}