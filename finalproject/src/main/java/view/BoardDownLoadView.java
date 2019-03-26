package view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardDownLoadView extends AbstractView{
	private BoardDAO bdao;
	
	public BoardDownLoadView() {
		
	}

	public void setBdao(BoardDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int boardkind_canum = Integer.parseInt(request.getParameter("boardkind_canum"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		model.get("boardkind_canum");
		model.get("bnum");
		
		BoardDTO bdto = new BoardDTO();
		bdto.setBoardkind_canum(boardkind_canum);
		bdto.setBnum(bnum);
		
		String root = request.getSession().getServletContext().getRealPath("/");// root + "temp/"
		String saveDirectory = root + "temp" + File.separator;
		String bpath = bdao.getFile(bdto);
		String fileName = bpath.substring(bpath.indexOf("_") + 1);
		String str = URLEncoder.encode(fileName,"UTF-8");
		str = str.replaceAll("\\+", "%20");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + str + ";");
		FileCopyUtils.copy(new FileInputStream(new File(saveDirectory, bpath)), response.getOutputStream());
	}//end renderMergedOutputModel()
}//end class