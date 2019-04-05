package dao;

import java.util.List;
import dto.HosnameDTO;
import dto.HospitalDTO;

public interface HosnameDAO {

	public List<HosnameDTO> list();

	public int count();

	public void insert(HosnameDTO dto);

	public void delete(HosnameDTO dto);

	public HosnameDTO content(HosnameDTO dto);

	public int check(HosnameDTO dto);
	
	public void hosdelete(int hosnum);

}// end interface
