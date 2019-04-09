    
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
import dao.PetDAO;
import dto.MemDTO;
import dto.PetDTO;
import mail.TempKey;
import service.LoginService;
import service.MemberService;
import service.PetKindService;
import service.PetService;


//http://localhost:8090/pet/index.do

//

@Controller
public class IndexController {

	private LoginDAO l_dao;
	private PetDAO p_dao;
	private LoginService lservice;
	private PetService pservice;
	private PetKindService pkservice;
	private MemberService mservice;

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
	public PetDAO getP_dao() {
		return p_dao;
	}

	public void setP_dao(PetDAO p_dao) {
		this.p_dao = p_dao;
	}

	public PetService getPservice() {
		return pservice;
	}

	public void setPservice(PetService pservice) {
		this.pservice = pservice;
	}
	public PetKindService getPkservice() {
		return pkservice;
	}

	public void setPkservice(PetKindService pkservice) {
		this.pkservice = pkservice;
	}


	@RequestMapping("/generic.do")
	public String process1() {
		return "generic";
	}

	public MemberService getMservice() {
		return mservice;
	}

	public void setMservice(MemberService mservice) {
		this.mservice = mservice;
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
	public @ResponseBody int login(MemDTO dto,HttpSession session) {
		// m_dao.Login(m, session)을 호출하고 반환한다.
		int lchk = lservice.loginprocess(dto, session);

		
		if (lchk == 1) {
			MemDTO mdto = lservice.signloginprocess(dto);
			pservice.petinfoProcess(dto);
			session.setAttribute("id", mdto.getId());
			session.setAttribute("password", mdto.getPassword());			
			session.setAttribute("email", mdto.getEmail());
			session.setAttribute("name", mdto.getName());
			session.setAttribute("grade", mdto.getGrade());
			session.setAttribute("phonenum", mdto.getPhonenum());
			session.setAttribute("petprofile",pservice.petinfoProcess(dto));			
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
	
	@RequestMapping(value = "/emailChk.do", method = RequestMethod.POST)
	public @ResponseBody int emailChk(String email) {
		System.out.println(email);
		int echk = lservice.emailChkprocess(email);
		System.out.println("emailchk:" + echk);
		return echk;
	}

	@RequestMapping("/logout.do")
	public String logoutProcess(MemDTO dto, HttpSession session) {

		session.removeAttribute("id");
		session.removeAttribute("password");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("grade");
		session.removeAttribute("phonenum");
		session.removeAttribute("petprofile");
		// session.removeAttribute("dto");

		return "redirect:/index.do";
	}

	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public void signupprocess() {
		
	}
	   @RequestMapping(value="/signup.do", method=RequestMethod.POST)
       public String signupPOST(MemDTO dto) {

           lservice.insertMember(dto);
           
           return "index";
       }
	   
	   @RequestMapping("/admin.do")
		public ModelAndView adminProcess() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin");
			return mav;

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
		      messageHelper.setText("안녕하세요 SooCut 인증서비스 입니다. 문의하신 고객님의 비밀번호는  "+passsear+"  입니다.");  // 메일 내용
		     
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
		      messageHelper.setText("안녕하세요 SooCut 인증서비스 입니다. email 인증코드는  "+key+"  입니다.");  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		return key;
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(MemDTO dto,HttpSession session) {
		MemDTO tdto = new MemDTO();
		tdto.setId((String)session.getAttribute("id"));
		tdto.setPassword((String)session.getAttribute("password"));
		System.out.println("qdididid  :  "+session.getAttribute("id"));
		System.out.println("dndld:   "+session.getAttribute("password"));
		MemDTO mdto = lservice.signloginprocess(tdto);		
		pservice.petinfoProcess(tdto);
		
		session.removeAttribute("id");
		session.removeAttribute("password");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("grade");
		session.removeAttribute("phonenum");
		session.removeAttribute("petprofile");
		

		session.setAttribute("id", mdto.getId());
		session.setAttribute("password", mdto.getPassword());
		session.setAttribute("email", mdto.getEmail());
		session.setAttribute("name", mdto.getName());
		session.setAttribute("grade", mdto.getGrade());
		session.setAttribute("phonenum", mdto.getPhonenum());
		session.setAttribute("petprofile",pservice.petinfoProcess(tdto));
		System.out.println();
		return "mypage";
	}
	@RequestMapping(value = "/membermodify.do", method = RequestMethod.GET)
	public String membermodify(HttpSession session) {	
		
		return "membermodify";
	}
	

	@RequestMapping(value = "/petinsert.do", method = RequestMethod.GET)
	public ModelAndView petinsert() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("petkind", pkservice.listProcess());
		mav.setViewName("petinsert");
		return mav;
	}

	@RequestMapping(value = "/petinsert.do", method = RequestMethod.POST)
	public ModelAndView petinsertPost(PetDTO pdto,MemDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		pservice.insertProcess(pdto);
		session.removeAttribute("petprofile");
		session.setAttribute("petprofile",pservice.petinfoProcess(dto));	
		mav.setViewName("redirect:mypage.do");
		return mav;
	}
	@RequestMapping("/taltwaesuccess.do")
	public ModelAndView taltwaesuccess(String[] id,HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mservice.deleteProcess(id);
		mav.addObject("count", mservice.countProcess());
		mav.addObject("list", mservice.listProcess());		
		session.removeAttribute("id");
		session.removeAttribute("password");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("grade");
		session.removeAttribute("phonenum");
		session.removeAttribute("petprofile");
		return mav;
	}
	@RequestMapping("/memtaltwae.do")
	public String memtaltwae() {		
		return "memtaltwae";
	}
	@RequestMapping("/thankyou.do")
	public String thankyou() {		
		return "taltwaesuccess";
	}
	@RequestMapping("/MypagePetDelete.do")
	public ModelAndView adminPetDeleteProcess(MemDTO dto,HttpSession session,String[] chk) {
		ModelAndView mav = new ModelAndView();		
		MemDTO tdto = new MemDTO();
		tdto.setId((String)session.getAttribute("id"));
		tdto.setPassword((String)session.getAttribute("password"));	
		pservice.deleteProcess(chk);		
		session.removeAttribute("petprofile");
		session.setAttribute("petprofile",pservice.petinfoProcess(tdto));
		mav.setViewName("redirect:mypage.do");
		return mav;
	}
}
