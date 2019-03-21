package service;

import java.util.List;

import dto.ReservationDTO;

public interface ReservationService {
	
	public void saveProcess(ReservationDTO dto);
	public List<ReservationDTO> search(String member_id);
	public List<ReservationDTO> r_list();
	public List<ReservationDTO> r_deleteProcess(ReservationDTO dto);

}//end class
