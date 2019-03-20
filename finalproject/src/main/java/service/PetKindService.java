package service;

import java.util.List;

import dto.PetKindDTO;

public interface PetKindService {
	public int countProcess();
	public List<PetKindDTO> listProcess();
	public void insertProcess(PetKindDTO dto);
	public void updateProcess(PetKindDTO dto);
	public void deleteProcess(String[] chk);
	public int contentProcess(PetKindDTO dto);
}
