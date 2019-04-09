package controller;

import java.util.Date;
import java.io.UnsupportedEncodingException;
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
import dto.HosmapDTO;
import dto.ReservationDTO;
import service.ReservationService;

//http://localhost:8090/pet/main.do

@Controller
public class Reservationcontroller {
	private ReservationService rservice;
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	public Reservationcontroller() {
		
	}
	
	
	public JavaMailSenderImpl getMailSender() {
		return mailSender;
	}
	
	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}



	public void setRservice(ReservationService rservice) {
		this.rservice = rservice;
	}
	
	

	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	DateFormat dateFormat2= new SimpleDateFormat("yyyy년 MM월 dd일 hh : mm");
	
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
	
	/*@RequestMapping(value="/reservation.do", method = RequestMethod.POST)
	public String reservationpro(ReservationDTO dto, String red ) {	
		
		System.out.println("품종 : " + dto.getPetpet());
		System.out.println("병원 번호 : " + dto.getHospital_hosnum());
		System.out.println("아이디 : " + dto.getMember_id());
		System.out.println("증상: "+ dto.getPetinfo());
		try {
			System.out.println("예약 날짜 : " + dateFormat.parse(red));
			dto.setRes_date(dateFormat.parse(red));
			
			rservice.saveProcess(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "redirect:reservationok.do";
	}*/
	
	//예외추가
	@RequestMapping("/reservationok.do")
	public ModelAndView reservationokMethod(ReservationDTO dto, String red ,String email ) throws UnsupportedEncodingException, MessagingException  {
		ModelAndView mav = new ModelAndView();
		
		
		//추가한 것
		String text;
		text = " 안녕하십니까, SooCut 예약서비스 입니다. 고객님의 예약이 성공적으로 완료되었습니다. \n";
		text += " 예약하신 병원의 이름은 " + dto.getHospital_hosname() + " 이며 진찰받으실 동물의 품종은 " + dto.getPetpet() + " 입니다.\n ";
		text += " 이전 예약 고객분에 의해 진료의 시간이 길어질 수가 있으니 유의하시기 바랍니다. ";
	
		try {
			dto.setRes_date(dateFormat.parse(red));
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("snrnaudwls@gmail.com","수컷 예약서비스");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(email);     // 받는사람 이메일
		      messageHelper.setSubject("[Soocut] 예약 서비스입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText(text);
		      mailSender.send(message);
			
			rservice.saveProcess(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		mav.addObject("dto", dto);
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
	
	//추가
	@RequestMapping("/rfsearch.do")
	public ModelAndView fsearchMethod(int res_num) {
		
		ModelAndView mav = new ModelAndView();
		/*System.out.println(res_num); // 받아온 예약 번호*/		
		mav.addObject("dto", rservice.r_fsearch(res_num));
		mav.setViewName("reservation_fsearch");
		return mav;
	}
	
	@RequestMapping(value="/rupdate.do", method=RequestMethod.POST)
	public @ResponseBody ReservationDTO update(String resnum, ReservationDTO dto, HttpSession session) {
		dto.setRes_num(Integer.parseInt(resnum));
		System.out.println(" (업데이트)받아온 값 : " + dto.getRes_num());
		
		dto = rservice.r_fsearch(dto.getRes_num());
		return dto;
	}
	
	@RequestMapping(value="/rupdatepage.do", method=RequestMethod.GET)
	public ModelAndView rupdatepage(ReservationDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("res_num",dto.getRes_num());
		
		System.out.println(" (페이지) 받아온 값 : " + dto.getRes_num());		
		System.out.println(" (페이지) 받아온 날짜 : " + session.getAttribute("res_date"));
		System.out.println(" (페이지) 받아온 증상 : " + session.getAttribute("petinfo"));

		mav.setViewName("reservation_update");
		
		return mav;
	}
	
	@RequestMapping(value="/reupdatepro.do", method=RequestMethod.POST)
	public ModelAndView updatepro(ReservationDTO dto, String red, String email, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String text;
		text = " 안녕하십니까, SooCut 예약서비스 입니다. 고객님의 수정이 성공적으로 완료되었습니다. \n";
		text += " 수정하신 병원의 이름은 " + dto.getHospital_hosname() + " 이며 진찰받으실 동물의 품종은 " + dto.getPetpet() + " 입니다.\n ";
		text += " 이전 예약 고객분에 의해 진료의 시간이 길어질 수가 있으니 유의하시기 바랍니다. ";
		
		try {
			System.out.println("예약 날짜 : " + dateFormat.parse(red));
			System.out.println("예약 번호 : " + dto.getRes_num());
			System.out.println("예약 증상 : " + dto.getPetinfo());
			dto.setRes_date(dateFormat.parse(red));
			  MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("snrnaudwls@gmail.com","수컷 예약서비스");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(email);     // 받는사람 이메일
		      messageHelper.setSubject("[Soocut] 예약 서비스입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText(text);
		      mailSender.send(message);

			rservice.updateProcess(dto);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		// 세션 삭제
		session.removeAttribute("res_date");
		session.removeAttribute("res_petpet");
		session.removeAttribute("res_petinfo");
		
		mav.setViewName("redirect:/search.do");
		return mav;
	}
}

