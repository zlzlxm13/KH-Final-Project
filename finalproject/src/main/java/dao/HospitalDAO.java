package dao;


import java.util.List;
import dto.HosmapDTO;
import dto.HospitalDTO;


public interface HospitalDAO {

	public List<HosmapDTO> list();
	public int count();

	
	public void insert(HospitalDTO dto);
	public void update(HosmapDTO dto);
	public void delete(String[] chk);
	public HosmapDTO content(HosmapDTO dto);
	public int check(HosmapDTO dto);
	public int hos_seq();

}//end interface
