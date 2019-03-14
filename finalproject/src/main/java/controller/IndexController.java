    
package controller;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.LoginDAO;
import dto.MemDTO;

import service.LoginService;

//http://localhost:8090/pet/index.do
@Controller
public class IndexController {

	private LoginDAO l_dao;
	private LoginService lservice;
	
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
		if (lchk == 1){
			session.setAttribute("id", dto.getId());
			session.setAttribute("pass", dto.getPass());
			session.setAttribute("email",dto.getEmail());
			session.setAttribute("name",dto.getName());
			session.setAttribute("grade",dto.getGrade());
			session.setAttribute("phonenum",dto.getPhonenum());
			
			//session.setAttribute("dto",dto);
		
		}else {
			
		}
			

		//if()
		return lchk;
	}
	
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public @ResponseBody int idChk(String id) {
		System.out.println(id);
		
		int chk =lservice.idChkprocess(id);
		System.out.println("con:"+chk);
		return chk;	
	}

	@RequestMapping("/logout.do")
	public String logoutProcess(MemDTO dto,HttpSession session) {
		
		session.removeAttribute("id");
		session.removeAttribute("pass");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("grade");
		session.removeAttribute("phonenum");	
		//session.removeAttribute("dto");
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

	

}
