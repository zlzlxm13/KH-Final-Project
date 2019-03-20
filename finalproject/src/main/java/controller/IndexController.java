package controller;



import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import dao.LoginDAO;
import dto.MemDTO;
import mail.TempKey;
import service.LoginService;



//http://localhost:8090/pet/index.do
//
@Controller
public class IndexController {

	private LoginDAO l_dao;


	private LoginService lservice;	
	//private JavaMailSender mailSender;
	@Autowired 
	private JavaMailSenderImpl mailSender;

public JavaMailSenderImpl getMailSender() {
		return mailSender;
}

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;

	}


	public LoginDAO getL_dao() {
		return l_dao;
	}


	public void setL_dao(LoginDAO l_dao) {
		this.l_dao = l_dao;
	}

	public LoginService getLservice() {
		return lservice;
	}

	public void setLservice(LoginService lservice) {
		this.lservice = lservice;

	}

	@RequestMapping("/generic.do")
	public String process1() {
		return "generic";
	}

	@RequestMapping("/elements.do")
	public String process2() {
		return "elements";
	}



	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		// VIEW 폴더애 login.jsp 파일을 뷰페이지로 선언
		return "login";
	}


	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	// login이라는 메소드명을 가지고 매개변수는 member m, Httpsession session
	public @ResponseBody int login(MemDTO dto, HttpSession session) {
		// m_dao.Login(m, session)을 호출하고 반환한다.
		int lchk = lservice.loginprocess(dto, session);
		if (lchk == 1) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("pass", dto.getPass());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("name", dto.getName());
			session.setAttribute("grade", dto.getGrade());
			session.setAttribute("phonenum", dto.getPhonenum());

			// session.setAttribute("dto",dto);

		} else {

		}

		// if()

		return lchk;
	}
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public @ResponseBody int idChk(String id) {
		System.out.println(id);

		int chk = lservice.idChkprocess(id);
		System.out.println("con:" + chk);
		return chk;
	}

	@RequestMapping("/logout.do")
	public String logoutProcess(MemDTO dto, HttpSession session) {

		session.removeAttribute("id");
		session.removeAttribute("pass");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("grade");
		session.removeAttribute("phonenum");
		// session.removeAttribute("dto");
		return "redirect:/index.do";
	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public void signupprocess() {

	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signupPOST(MemDTO dto) {

		lservice.insertMember(dto);

		return "index";
	}

	@RequestMapping(value = "/memsearch.do", method = RequestMethod.GET)
	public String memsearchProcess() {
		// VIEW 폴더애 login.jsp 파일을 뷰페이지로 선언
		return "memsearch";
	}

	@RequestMapping(value = "/idsearch.do", method = RequestMethod.POST)
	public @ResponseBody String idsearchPost(MemDTO dto) {

		String idsear=lservice.idsearchprocess(dto);
		System.out.println(idsear);
		return idsear;
	}
	@RequestMapping(value = "/passsearch.do", method = RequestMethod.POST)
	public @ResponseBody String passsearchPost(MemDTO dto) {
		String passsear=lservice.passearchprocess(dto);
		System.out.println(dto.getEmail());
		System.out.println(passsear);
		try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("snrnaudwls@gmail.com","수컷");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(dto.getEmail());     // 받는사람 이메일
		      messageHelper.setSubject("[Soocut] 비밀번호찾기 서비스입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText("안녕하세요 SooCut 인증서비스 입니다. 문의하신 고객님의 비밀번호는"+passsear+"입니다.");  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		return passsear;
	}

	@RequestMapping(value = "/sendMail.do")
	public @ResponseBody String sendMail(HttpServletRequest request) {
		//System.out.println("emall:"+email);
		System.out.println("emall:"+request.getParameter("email"));
		String key = new TempKey().getKey(6, false); 
		try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("snrnaudwls@gmail.com","수컷");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(request.getParameter("email"));     // 받는사람 이메일
		      messageHelper.setSubject("[Soocut] Email인증코드 입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText("안녕하세요 SooCut 인증서비스 입니다. email 인증코드는"+key+"입니다.");  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		return key;
	}
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() {	
		return "mypage";
	}

	@RequestMapping("/admin.do")
	public ModelAndView adminProcess() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin");
		return mav;

	}


}
