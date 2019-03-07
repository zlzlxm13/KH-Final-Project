package service;

import dto.HospitalDTO;

public interface HospitalService {
	public int countProcess();
	public HospitalDTO ListProcess(int num);
	public void updateProcess(HospitalDTO dto);
	public void deleteProcess(int num);
}
