package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.HosmapDAO;
import service.HosService;
import service.LoginService;



@Controller
public class AdminController {

	private HosService hservice;

	public HosService getHservice() {
		return hservice;
	}

	public void setHservice(HosService hservice) {
		this.hservice = hservice;
	}

	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/adminMember.do")
	public ModelAndView adminMemberProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/member");
		return mav;

	}
	@RequestMapping("/adminHospital.do")
	public ModelAndView adminHospitalProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin/hospital");
		return mav;

	}
	
	@RequestMapping("/adminPet.do")
	public ModelAndView adminPetProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/pet");
		return mav;

	}
	
	@RequestMapping("/adminReservation.do")
	public ModelAndView adminReservationProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/reservation");
		return mav;

	}
	
	@RequestMapping("/adminBoard.do")
	public ModelAndView adminBoardProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/board");
		return mav;

	}
	
	@RequestMapping("/adminHospitalinsert.do")
	public ModelAndView adminHospitalInsertProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/hospital/insert");
		return mav;

	}
}
