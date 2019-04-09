package service;

import java.util.List;

import dto.HosmapDTO;
import dto.HospitalDTO;


public interface HospitalService {
	public List<HosmapDTO> listProcess();
	public int countProcess();
	public void insertProcess(HospitalDTO dto);
	public void updateProcess(HosmapDTO dto);
	public void deleteProcess(String[] chk);
	public int checkProcess(HosmapDTO dto);
	public HosmapDTO contentProcess(HosmapDTO dto);
	public int hos_seq();

}//end Service
