package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/admin.do")
	public String adminProcess() {
		return "admin";
	}
}