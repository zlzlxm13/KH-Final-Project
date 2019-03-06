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

}