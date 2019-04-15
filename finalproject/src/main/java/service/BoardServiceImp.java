package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import dao.BoardDAO;
import dto.BoardDTO;
import dto.BoardkindDTO;
import dto.PageDTO;

public class BoardServiceImp implements BoardService{
	private BoardDAO bdao;

	public BoardServiceImp() {
		
	}

	public void setBdao(BoardDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	public int count(int boardkind_canum) {
		return bdao.count(boardkind_canum);
	}

	@Override
	public List<BoardDTO> boardList(PageDTO pdto) {	//PageDTO pv
		return bdao.boardList(pdto);
	}

	@Override
	public BoardDTO boardView(BoardDTO bdto) {
		bdao.readCount(bdto);
		return bdao.boardView(bdto);
	}
	
	@Override
	public List<BoardkindDTO> catitle(int boardkind_canum) {
		return bdao.catitle(boardkind_canum);
	}
	
	@Override
	public void boardInsert(BoardDTO bdto) {
		bdao.boardInsert(bdto);
	}
	
	@Override
	public BoardDTO boardUpdateSelect(BoardDTO bdto) {
		return bdao.boardView(bdto);
	}
	
	@Override
	public void boardUpdate(BoardDTO bdto, HttpServletRequest request) {
		String fname = bdao.getFile(bdto);
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		
		MultipartFile f = bdto.getFilename();
		if(!f.isEmpty()) {
			UUID random = UUID.randomUUID();
			if(fname != null){
				File f2 = new File(saveDirectory, fname);
				f2.delete();
			}
			
			String fname2 = f.getOriginalFilename();
			bdto.setBpath(random + "_" + fname2);
			File f2 = new File(saveDirectory, random + "_" + fname2);
			
			try {
				FileCopyUtils.copy(f.getInputStream(), new FileOutputStream(f2));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		request.getRemoteAddr();
		bdao.boardUpdate(bdto);
	}
	
	@Override
	public void boardDelete(BoardDTO bdto) {
		bdao.boardDelete(bdto);
	}
	
	@Override
	public void replyCount(BoardDTO bdto) {
		bdao.replyCount(bdto);	
	}
}