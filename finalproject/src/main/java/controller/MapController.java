package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.HosmapDTO;
import dto.ReservationDTO;
import service.HosService;

//http://localhost:8090/pet/hosmap.do

@Controller
public class MapController {
	private HosService service;
	
	public MapController() {
		
	}
	
	public void setService(HosService service) {
		this.service = service;
	}
	
	@RequestMapping("/hosmap.do")
	public String mapForm() {
		return "hosmap";
	}//end mapForm()////////////////////
	
	@RequestMapping("/updatemap.do")
	public ModelAndView upmapForm(ReservationDTO dto) {
		System.out.println(dto.getRes_num());
		ModelAndView mav = new ModelAndView();
		mav.addObject("res_num",dto.getRes_num());
		System.out.println(" (맵)받아온 값 : " + dto.getRes_num());
		mav.setViewName("updatemap");
		return mav;
	}//end mapForm()////////////////////
	
	@RequestMapping("/hosmap1.do")
	public @ResponseBody ModelAndView hospitalMap(int pageNo,
			int pageSize, String keyword) {
		ModelAndView mav = new ModelAndView();
		int countAll=service.f_countAllProcess(keyword);
		int totalPage=countAll/pageSize;
		if((countAll%pageSize)>0)
			totalPage++;
		
		List<HosmapDTO> aList=
				service.f_listProcess(pageNo, pageSize, keyword);
	
		mav.addObject("aList", aList);
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalPage", totalPage);
		mav.setViewName("jsonView");
		return mav;		
	}//end hospitalMap()///////////////////
	
}//end class////////////////////////////////////
