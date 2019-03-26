package controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
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
import service.ReservationService;

@Controller

//http://localhost:8090/pet/main.do
//http://localhost:8090/pet/reservationok.do
public class Reservationcontroller {
	
	private ReservationService rservice;
	
	
	public Reservationcontroller() {
		
	}
	
	
	public void setRservice(ReservationService rservice) {
		this.rservice = rservice;
	}

    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");

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
	public String reservationpro(ReservationDTO dto, String red ) {	
		
		/* System.out.println("예약 날짜 : " + dto.getRes_date()); */
		System.out.println("병원 번호 : " + dto.getHospital_hosnum());
		System.out.println("아이디 : " + dto.getMember_id());
		
		try {
			System.out.println("예약 날짜 : " + dateFormat.parse(red));
			dto.setRes_date(dateFormat.parse(red));

			rservice.saveProcess(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "redirect:reservationok.do";
	}
	

	@RequestMapping("/reservationok.do")
	public ModelAndView reservationokMethod() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservationok");
		return mav;
		
	}
	
	@RequestMapping("/search.do")
	public String Search() {
		return "search";
	}
	
	@RequestMapping("/searchpro.do")
	public @ResponseBody List<ReservationDTO> SearchForm(String member_id) {
		return rservice.search(member_id);
	}
	
	/*@RequestMapping("/list.do")
	public ModelAndView listForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", rservice.r_list());
		mav.setViewName("list");
		return mav;
	}*/
	
	@RequestMapping("/delete.do")
	public @ResponseBody List<ReservationDTO> delete(ReservationDTO dto) {
		return rservice.r_deleteProcess(dto);
	}
	
}
