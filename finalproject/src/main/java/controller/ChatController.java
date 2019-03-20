package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

//http://localhost:8090/pet/chat.do

@Controller
public class ChatController {
	
	@RequestMapping("chat.do")
	public String process() {
		return "hoschat";
	}
	
}//end class
