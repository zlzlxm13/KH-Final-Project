package service;

import java.util.List;

import dto.HosnameDTO;
import dto.HospitalDTO;

public interface HosnameService {
	public List<HosnameDTO> listProcess();

	public int countProcess();

	public void insertProcess(HosnameDTO dto);

	public void deleteProcess(HosnameDTO dto);

	public int checkProcess(HosnameDTO dto);

	public HosnameDTO contentProcess(HosnameDTO dto);
	
	public void hosdeleteProcess(int hosnum);
}// end Service
