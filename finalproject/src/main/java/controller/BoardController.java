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
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import service.BoardService;

//http://localhost:8090/pet/board/list.do

@Controller
public class BoardController {
	private BoardService bservice;
	private int currentPage;
	
	public BoardController() {
		
	}
	
	public void setBservice(BoardService bservice) {
		this.bservice = bservice;
	}
	
	@RequestMapping("/board/list.do")
	public ModelAndView listMethod(int boardkind_canum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", bservice.listProcess(boardkind_canum));	
		mav.setViewName("board/list");
		return mav;
	}
	
	@RequestMapping("/board/view.do")
	public ModelAndView viewMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", bservice.viewProcess(bdto));
		mav.setViewName("board/view");
		return mav;
	}
	
	@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
	public ModelAndView writeMethod(BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		//mav.addObject("currentPage", pv.getCurrentPage());
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
		bservice.insertProcess(bdto);
		
		return "redirect:/board/list.do?boardkind_canum=" + bdto.getBoardkind_canum();
	}
	
	@RequestMapping("/board/bcontentdownload.do")
	public ModelAndView downMethod(int bnum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bnum", bnum);
		mav.setViewName("download");
		return mav;
	}
}