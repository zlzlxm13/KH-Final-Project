package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import service.LoginService;



@Controller
public class AdminController {
	
	

	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/adminMember.do")
	public ModelAndView adminMembersProcess() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/member");
		return mav;

	}
}
