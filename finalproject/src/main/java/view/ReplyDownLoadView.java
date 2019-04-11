package view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import dao.ReplyDAO;
import dto.ReplyDTO;

public class ReplyDownLoadView extends AbstractView{
	private ReplyDAO rdao;
	
	public ReplyDownLoadView() {
		
	}

	public void setRdao(ReplyDAO rdao) {
		this.rdao = rdao;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int boardkind_canum = Integer.parseInt(request.getParameter("boardkind_canum"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		model.get("boardkind_canum");
		model.get("bnum");
		model.get("rnum");
		
		ReplyDTO rdto = new ReplyDTO();
		rdto.setBoardkind_canum(boardkind_canum);
		rdto.setBnum(bnum);
		rdto.setRnum(rnum);
		
		String root = request.getSession().getServletContext().getRealPath("/");// root + "temp/"
		String saveDirectory = root + "temp" + File.separator;
		String bpath = rdao.getFile(rdto);
		String fileName = bpath.substring(bpath.indexOf("_") + 1);
		String str = URLEncoder.encode(fileName,"UTF-8");
		str = str.replaceAll("\\+", "%20");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + str + ";");
		FileCopyUtils.copy(new FileInputStream(new File(saveDirectory, bpath)), response.getOutputStream());
	}//end renderMergedOutputModel()
}//end class