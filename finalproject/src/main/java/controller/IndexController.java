package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.HospitalService;


//testsetset
//http://localhost:8090/pet/index.do
@Controller
public class IndexController {
	private HospitalService service;
	
	public HospitalService getService() {
		return service;
	}
	public void setService(HospitalService service) {
		this.service = service;
	}
	
	
	@RequestMapping("/index.do")
	public String process() {
		return "index";
	}
	@RequestMapping("/generic.do")
	public String process1() {
		return "generic";
	}
	@RequestMapping("/elements.do")
	public String process2() {
		return "elements";
	}
<<<<<<< HEAD
	@RequestMapping("/login.do")
	public String loginprocess() {
		return "login";
	}
	@RequestMapping("/signup.do")
	public String signupprocess() {
		return "signup";
=======
	
	@RequestMapping("/admin.do")
	public ModelAndView adminProcess() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", service.countProcess());
		mav.setViewName("admin");

		return mav;

>>>>>>> branch 'tyee' of https://github.com/zlzlxm13/KH-Final-Project.git
	}
}