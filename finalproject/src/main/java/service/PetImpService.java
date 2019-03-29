package service;

import java.util.List;

import dao.PetDAO;
import dto.MemDTO;
import dto.PetDTO;

public class PetImpService implements PetService{
	private PetDAO dao;

	public PetImpService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PetDAO getDao() {
		return dao;
	}

	public void setDao(PetDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<PetDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void insertProcess(PetDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateProcess(PetDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		dao.delete(chk);
	}

	@Override
	public int checkProcess(PetDTO dto) {
		// TODO Auto-generated method stub
		return dao.check(dto);
	}

	@Override
	public PetDTO contentProcess(PetDTO dto) {
		// TODO Auto-generated method stub
		return dao.content(dto);
	}

	@Override
	public List<PetDTO> petinfoProcess(MemDTO dto) {
		// TODO Auto-generated method stub
		return dao.petinfo(dto);
	}

	
	
}
