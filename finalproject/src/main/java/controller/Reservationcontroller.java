package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.servlet.ModelAndView;

import dao.ReservationDAO;
import dto.ReservationDTO;
import service.ReservationService;

//http://localhost:8090/pet/main.do

@Controller
public class Reservationcontroller {
	
	private ReservationService rservice;
	
	public Reservationcontroller() {
		
	}
	public void setService(ReservationService rservice) {
		this.rservice = rservice;
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
	public String reservationpro(ReservationDTO rdto) {
		
		/*SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String res_date = date.format(Calendar.getInstance().getTime());
		*/
		
		System.out.println(rdto.getMember_id());
		
		rservice.insertProcess(rdto);
		
		return "redirect:main";
	}
	
	
}
