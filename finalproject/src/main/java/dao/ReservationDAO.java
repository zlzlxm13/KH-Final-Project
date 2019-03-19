package dao;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationDAO {
<<<<<<< HEAD
	public void ReservationInsertMethod(ReservationDTO rdto);
=======
	
	public void save(ReservationDTO dto);
	public List<ReservationDTO> search(String member_id);
	public List<ReservationDTO> r_list();
	public void r_delete(int num);
	
>>>>>>> branch 'testbranch' of https://github.com/zlzlxm13/KH-Final-Project
	
	
}//end interface
