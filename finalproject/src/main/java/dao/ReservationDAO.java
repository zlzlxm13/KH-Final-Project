package dao;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationDAO {
	
	public void save(ReservationDTO dto);
	public List<ReservationDTO> r_search(String member_id);
	public ReservationDTO r_fsearch(int res_num);
	public void r_delete(int num);
	public void r_update(ReservationDTO dto);
	
	
	
}//end interface
