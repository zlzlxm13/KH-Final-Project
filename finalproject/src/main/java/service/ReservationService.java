package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.ReservationDTO;


public interface ReservationService {
	
	public int countProcess();
	public List<ReservationDTO> listProcess();
	public void insertProcess(ReservationDTO dto);
	public void updateProcess(ReservationDTO dto);
	public void deleteProcess(String[] chk);
	public int checkProcess(ReservationDTO dto);
	public ReservationDTO contentProcess(ReservationDTO dto);
	
}//end interface
