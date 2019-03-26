package dao;

import java.util.List;

import dto.ReservationDTO;



public interface ReservationDAO {
	
	public void save(ReservationDTO dto);
	public List<ReservationDTO> search(String member_id);
	public List<ReservationDTO> r_list();
	public void r_delete(int num);
	
	
	
	public int count();
	public List<ReservationDTO> list();
	public void insert(ReservationDTO dto);
	public void update(ReservationDTO dto);
	public void delete(String[] chk);
	public ReservationDTO content(ReservationDTO dto);
	public int check(ReservationDTO dto);
	
	
	
}//end interface
