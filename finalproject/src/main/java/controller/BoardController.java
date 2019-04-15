package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;
import service.BoardService;
import service.ReplyService;

//http://localhost:8090/pet/board/list.do

@Controller
public class BoardController {
	private BoardService bservice;
	private ReplyService repservice;
	private int currentPage = 1;
	
	public BoardController() {
		
	}
	
	public void setBservice(BoardService bservice) {
		this.bservice = bservice;
	}
	
	public void setRepservice(ReplyService repservice) {
		this.repservice = repservice;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	@RequestMapping("/board/list.do")
	public ModelAndView listMethod(PageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		int currentPage = 1;
		if(pdto.getCurrentPage() == 0) {
			currentPage = 1;
		}else {
			currentPage = pdto.getCurrentPage();
		}
		int cnt = bservice.count(pdto.getBoardkind_canum());

		PageDTO dto = new PageDTO(currentPage, cnt, pdto.getBoardkind_canum());
		
		mav.addObject("cat", bservice.catitle(pdto.getBoardkind_canum()));
		mav.addObject("list", bservice.boardList(dto));
		mav.addObject("pdto", dto);
		
		mav.setViewName("board/list");
		return mav;
	}
	
	@RequestMapping(value = "/board/view.do", method = RequestMethod.GET)
	public ModelAndView viewMethod(BoardDTO bdto, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", bservice.boardView(bdto));
		mav.addObject("ReplyDTO", repservice.replyList(rdto));
		mav.setViewName("board/view");
		return mav;
	}
	
	@RequestMapping(value = "/board/view.do", method = RequestMethod.POST)
	public String viewProMethod(BoardDTO bdto, ReplyDTO rdto, HttpServletRequest request) {
		MultipartFile f = rdto.getFilename();
		if(!f.isEmpty()) {
			String fname = f.getOriginalFilename();
			UUID random = UUID.randomUUID();
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory = root + "temp" + File.separator;
			File f2 = new File(saveDirectory);
			if(!f2.exists())
				f2.mkdirs();
			File f3 = new File(saveDirectory, random + "_" + fname);
			try {
				FileCopyUtils.copy(f.getInputStream(), new FileOutputStream(f3));
			} catch(IOException e) {
				e.printStackTrace();
			}
			
			rdto.setRpath(random + "_" + fname);
		}  
		repservice.replyInsert(rdto);
		bdto.setCol(repservice.count(rdto));
		bservice.replyCount(bdto);
		request.getRemoteAddr();
		return "redirect:/board/view.do?boardkind_canum=" + rdto.getBoardkind_canum() + "&bnum=" + rdto.getBnum();
	}
	
	@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
	public ModelAndView updateMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", bservice.boardUpdateSelect(bdto));
		mav.setViewName("board/update");
		return mav;
	}
	
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public ModelAndView updateProMethod(BoardDTO bdto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		bservice.boardUpdate(bdto, request);
		mav.setViewName("redirect:/board/list.do?boardkind_canum=" + bdto.getBoardkind_canum());
		return mav;
	}
	
	@RequestMapping(value = "/board/updateReply.do", method = RequestMethod.GET)
	public ModelAndView updateReplyMethod(ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("rdto", repservice.replyUpdateStart(rdto));
		mav.setViewName("board/updateReply");
		return mav;
	}
	
	@RequestMapping(value = "/board/updateReply.do", method = RequestMethod.POST)
	public ModelAndView updateReplyProMethod(ReplyDTO rdto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		repservice.replyUpdate(rdto, request);
		mav.setViewName("redirect:/board/view.do?boardkind_canum=" + rdto.getBoardkind_canum() + "&bnum=" + rdto.getBnum());
		return mav;
	}
	
	@RequestMapping("/board/delete.do")
	public ModelAndView deleteMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		bdto.setBoardkind_canum(bdto.getBoardkind_canum());
		bdto.setBnum(bdto.getBnum());
		bservice.boardDelete(bdto);
		
		mav.setViewName("redirect:/board/list.do?boardkind_canum=" + bdto.getBoardkind_canum());
		return mav;
	}
	
	
	@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
	public ModelAndView writeMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", bdto);
		mav.setViewName("board/write");
		return mav;
	}
	
	@RequestMapping(value = "/board/write.do", method = RequestMethod.POST)
	public String writeProMethod(BoardDTO bdto, HttpServletRequest request) {
		MultipartFile file = bdto.getFilename();
		if(!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			UUID random = UUID.randomUUID();	//
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory = root + "temp" + File.separator;
			File f2 = new File(saveDirectory);
			if(!f2.exists())
				f2.mkdirs();
			File f3 = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(f3));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			bdto.setBpath(random + "_" + fileName);
		}
		request.getRemoteAddr();
		bservice.boardInsert(bdto);
		
		return "redirect:/board/list.do?boardkind_canum=" + bdto.getBoardkind_canum();
	}
	
	@RequestMapping("/board/deleteReply.do")
	public ModelAndView deleteReply(BoardDTO bdto, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		int rn = rdto.getRnum();
		rdto.setRnum(rdto.getRnum());
		repservice.replyDelete(rdto);
		rdto.setRnum(rn);
		repservice.decreaseRnum(rdto);
		bdto.setCol(repservice.count(rdto));
		bservice.replyCount(bdto);
		mav.setViewName("redirect:/board/view.do?boardkind_canum=" + rdto.getBoardkind_canum() + "&bnum=" + rdto.getBnum());
		return mav;
	}
	
	@RequestMapping("/board/bcontentdownload.do")
	public ModelAndView downMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardkind_canum", bdto.getBoardkind_canum());
		mav.addObject("bnum", bdto.getBnum());
		mav.setViewName("bdownload");	//왜 작동이 안되지?
		return mav;
	}
	
	@RequestMapping("/board/rcontentdownload.do")
	public ModelAndView replyMethod(ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardkind_canum", rdto.getBoardkind_canum());
		mav.addObject("bnum", rdto.getBnum());
		mav.addObject("rnum", rdto.getRnum());
		mav.setViewName("rdownload");
		return mav;
	}
}