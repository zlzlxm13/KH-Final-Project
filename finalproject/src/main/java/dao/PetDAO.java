package dao;

import java.util.List;

import dto.PetDTO;

public interface PetDAO {
	public int count();
	public List<PetDTO> list();
	public void insert(PetDTO dto);
	public void update(PetDTO dto);
	public void delete(String[] chk);
	public PetDTO content(PetDTO dto);
	public int check(PetDTO dto);
	
}
