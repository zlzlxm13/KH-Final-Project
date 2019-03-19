package service;


import java.util.HashMap;
import java.util.Map;

import dao.ReservationDAO;
import dto.ReservationDTO;


public class ReservationServiceImp implements ReservationService{
	private ReservationDAO dao;
	
	public void setDao(ReservationDAO dao) {
		this.dao = dao;
	}



	@Override
	public void insertProcess(ReservationDTO rdto) {

		dao.ReservationInsertMethod(rdto);
	}
	
}
