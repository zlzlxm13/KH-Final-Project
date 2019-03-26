package service;

import java.util.List;

import dto.HosmapDTO;


public interface HospitalService {
	public List<HosmapDTO> listProcess();
	public int countProcess();
	public void insertProcess(HosmapDTO dto);
	public void updateProcess(HosmapDTO dto);
	public void deleteProcess(String[] chk);
	public int checkProcess(HosmapDTO dto);
	public HosmapDTO contentProcess(HosmapDTO dto);
}//end Service
