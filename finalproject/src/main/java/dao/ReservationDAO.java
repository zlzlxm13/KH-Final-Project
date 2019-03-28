package dao;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationDAO {
	
	public void save(ReservationDTO dto);
	public List<ReservationDTO> r_search(String member_id);
	public void r_delete(int num);
	
	
	
}//end interface
