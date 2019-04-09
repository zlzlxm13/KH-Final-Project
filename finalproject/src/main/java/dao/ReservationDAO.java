package dao;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationDAO {
	
	public void save(ReservationDTO dto);
	public List<ReservationDTO> r_search(String member_id);
	public void r_delete(int num);
	//추가
	public ReservationDTO r_fsearch(int res_num);
	public void r_update(ReservationDTO dto);
	
	public int count();
	public List<ReservationDTO> list();
	public void insert(ReservationDTO dto);
	public void update(ReservationDTO dto);
	public void delete(String[] chk);
	public ReservationDTO content(ReservationDTO dto);
	public int check(ReservationDTO dto);

	
}//end interface
