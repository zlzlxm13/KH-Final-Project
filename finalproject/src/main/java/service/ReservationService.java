package service;

import java.util.List;

import dto.ReservationDTO;

public interface ReservationService {
	
	public void saveProcess(ReservationDTO dto);
	public List<ReservationDTO> search(String member_id);
	public List<ReservationDTO> r_list();
	public List<ReservationDTO> r_deleteProcess(ReservationDTO dto);
	public ReservationDTO r_fsearch(int res_num);
	
	public int countProcess();
	public List<ReservationDTO> listProcess();
	public void insertProcess(ReservationDTO dto);
	public void updateProcess(ReservationDTO dto);
	public void deleteProcess(String[] chk);
	public int checkProcess(ReservationDTO dto);
	public ReservationDTO contentProcess(ReservationDTO dto);

}//end class
