package controller;

import org.springframework.stereotype.Controller;

import service.HosService;

@Controller
public class MapController {
	private HosService service;
	
	public MapController() {
		
	}
	
	public void setService(HosService service) {
		this.service = service;
	}
	
	
	
}//end class
