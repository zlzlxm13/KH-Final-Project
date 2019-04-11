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

import dao.ReplyDAO;
import dto.ReplyDTO;

public class ReplyServiceImp implements ReplyService{
	private ReplyDAO rdao;
	
	public ReplyServiceImp() {
	}
	
	public void setRdao(ReplyDAO rdao) {
		this.rdao = rdao;
	}
	
	@Override
	public int count(ReplyDTO rdto) {
		return rdao.count(rdto);
	}
	
	@Override
	public List<ReplyDTO> replyList(ReplyDTO rdto) {
		return rdao.replyList(rdto);
	}
	
	@Override
	public void replyInsert(ReplyDTO rdto) {
		rdao.replyInsert(rdto);	
	}
	
	@Override
	public ReplyDTO replyUpdateStart(ReplyDTO rdto) {
		return rdao.replyUpdateStart(rdto);	
	}
	
	@Override
	public void replyUpdate(ReplyDTO rdto, HttpServletRequest request) {
		String fname = rdao.getFile(rdto);
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		
		MultipartFile f = rdto.getFilename();
		if(!f.isEmpty()) {
			UUID random = UUID.randomUUID();
			if(fname != null){
				File f2 = new File(saveDirectory, fname);
				f2.delete();
			}
			
			String fname2 = f.getOriginalFilename();
			rdto.setRpath(random + "_" + fname2);
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
		rdao.replyUpdate(rdto);	
	}
	
	@Override
	public void decreaseRnum(ReplyDTO rdto) {
		rdao.decreaseRnum(rdto);
	}
	
	@Override
	public void replyDelete(ReplyDTO rdto) {
		rdao.replyDelete(rdto);	
	}
}