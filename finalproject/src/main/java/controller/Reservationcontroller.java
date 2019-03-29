package controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.ReservationDAO;
import dto.MemDTO;
import dto.ReservationDTO;
import service.ReservationService;

@Controller

//http://localhost:8090/pet/main.do
//http://localhost:8090/pet/reservationok.do
public class Reservationcontroller {
	
	private ReservationService rservice;
	@Autowired 
	private JavaMailSenderImpl mailSender;
	

	public JavaMailSenderImpl getMailSender() {
			return mailSender;
	}

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;

	}

	
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
	public ModelAndView reservation(MemDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		session.setAttribute("email", dto.getEmail());
		mav.setViewName("reservation");
		return mav;
	
	}
	
	@RequestMapping(value="/reservation.do", method = RequestMethod.POST)
	public String reservationpro(ReservationDTO dto, String red, String email,  HttpServletRequest request) {	
		
		System.out.println("동물 : " + dto.getPetpet());
		System.out.println("병원 이름 : " + dto.getHospital_hosname());
		System.out.println("이메일 : " + email);
		System.out.println("병원 번호 : " + dto.getHospital_hosnum());
		System.out.println("아이디 : " + dto.getMember_id());
		System.out.println("증상 : " + dto.getPetinfo());
		
		String text;
		text = " 안녕하십니까, SooCut 예약서비스 입니다. 고객님의 예약이 성공적으로 완료되었습니다. \n";
		text += " 예약하신 병원의 이름은 " + dto.getHospital_hosname() + " 이며 진찰받으실 동물의 품종은 " + dto.getPetpet() + " 입니다.\n ";
		text += " 이전 예약 고객분에 의해 진료의 시간이 길어질 수가 있으니 유의하시기 바랍니다. ";
		
		try {
			System.out.println("예약 날짜 : " + dateFormat.parse(red));
			dto.setRes_date(dateFormat.parse(red));
			  MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("snrnaudwls@gmail.com","수컷 예약서비스");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(email);     // 받는사람 이메일
		      messageHelper.setSubject("[Soocut] 예약 서비스입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText(text);
		      mailSender.send(message);

			  rservice.saveProcess(dto);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
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
	
	@RequestMapping("/delete.do")
	public @ResponseBody List<ReservationDTO> delete(ReservationDTO dto) {
		return rservice.r_deleteProcess(dto);
	}
	
	@RequestMapping("/fsearch.do")
	public ModelAndView fsearchMethod(ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(rservice.r_fsearch(dto));
		mav.setViewName("reservation_fsearch");
		return mav;
	}
	
}
