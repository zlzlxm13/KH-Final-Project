package dao;


import java.util.List;
import dto.HosmapDTO;


public interface HospitalDAO {

	public List<HosmapDTO> list();
	public int count();

	
	public void insert(HosmapDTO dto);
	public void update(HosmapDTO dto);
	public void delete(String[] chk);
	public HosmapDTO content(HosmapDTO dto);
	public int check(HosmapDTO dto);

}//end interface
