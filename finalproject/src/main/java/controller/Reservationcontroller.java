package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.ReservationDAO;
import dto.ReservationDTO;
//http://localhost:8090/pet/main.do

@Controller
public class Reservationcontroller {
	
	private ReservationDAO dao;
	
	public Reservationcontroller() {
		
	}
	
	
	public void setDao(ReservationDAO dao) {
		this.dao = dao;
	}
	
	


	@RequestMapping("/main.do")
	public ModelAndView listMethod() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
		
	}
		
	
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public ModelAndView reservation() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("reservation");
		return mav;
	
	}
	
	@RequestMapping(value="/reservation.do", method = RequestMethod.POST)
	public String reservationpro(ReservationDTO dto ) {	
		
		
		System.out.println("예약 날짜 : " + dto.getRes_date());
		System.out.println("병원 번호 : " + dto.getHospital_hosnum());
		System.out.println("아이디 : " + dto.getMember_id());
		dao.save(dto);
		//

		return "redirect:main.do";
	}
	
	@RequestMapping("/search.do")
	public String Search() {
		return "search";
	}
	
	@RequestMapping("/searchpro.do")
	public @ResponseBody List<ReservationDTO> SearchForm(String member_id) {

		return dao.search(member_id);
	}
	
	@RequestMapping("/list.do")
	public ModelAndView listForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.r_list());
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(int num) {
		ModelAndView mav = new ModelAndView();
		dao.r_delete(num);
		mav.setViewName("main");
		return mav;
	}
	
}
