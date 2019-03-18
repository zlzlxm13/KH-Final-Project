package dao;

import java.util.List;

import dto.PetKindDTO;

public interface PetKindDAO {
	public int count();
	public List<PetKindDTO> list();
	public void insert(PetKindDTO dto);
	public void update(PetKindDTO dto);
	public void delete(String[] chk);
	public PetKindDTO content(PetKindDTO dto);
	
}
