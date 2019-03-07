package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//testsetset
//http://localhost:8090/pet/index.do
@Controller
public class IndexController {
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
	@RequestMapping("/login.do")
	public String loginprocess() {
		return "login";
	}
	@RequestMapping("/signup.do")
	public String signupprocess() {
		return "signup";
	}
}