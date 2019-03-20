package service;

import java.util.List;

import dto.PetDTO;

public interface PetService {
	public int countProcess();
	public List<PetDTO> listProcess();
	public void insertProcess(PetDTO dto);
	public void updateProcess(PetDTO dto);
	public void deleteProcess(String[] chk);
	public int contentProcess(PetDTO dto);
}
