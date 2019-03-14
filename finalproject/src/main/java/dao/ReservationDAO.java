package dao;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationDAO {
	
	public void save(ReservationDTO dto);
	public void search(String data);
	public List<ReservationDTO> r_list();
	public void r_delete(int num);
	
	
	
}//end interface
