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
import service.HospitalService;
import service.LoginService;

//http://localhost:8090/pet/index.do
@Controller
public class IndexController {
	private HospitalService service;
	private LoginDAO l_dao;
	private LoginService lservice;

	public HospitalService getService() {
		return service;
	}

	public void setService(HospitalService service) {
		this.service = service;
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

	/////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		// VIEW 폴더애 login.jsp 파일을 뷰페이지로 선언
		return "login";
	}

	@ResponseBody
	// POST로 Login으로 요청을 할 경우
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	// login이라는 메소드명을 가지고 매개변수는 member m, Httpsession session
	public int login(MemDTO dto, HttpSession session) {
		// m_dao.Login(m, session)을 호출하고 반환한다.
		return l_dao.loginMethod(dto, session);
	}

	@RequestMapping("/idChk.do")
	public int idChk(String id) {
		return lservice.idChkprocess(id);
	}

	@RequestMapping("/logout.do")
	public String logoutProcess(HttpSession session) {
		session.removeAttribute("chk");
		return "redirect:/index";
	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public void signupprocess() {

	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signupPOST(MemDTO dto) {

		lservice.insertMember(dto);

		return "index";
	}

	/////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/admin.do")
	public ModelAndView adminProcess() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("count", service.countProcess());
		mav.setViewName("admin");

		return mav;

	}

}
