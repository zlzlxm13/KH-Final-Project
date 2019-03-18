package service;

import java.util.List;

import dao.PetKindDAO;
import dto.PetKindDTO;

public class PetKindImpService implements PetKindService{
	private PetKindDAO dao;

	public PetKindImpService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PetKindDAO getDao() {
		return dao;
	}

	public void setDao(PetKindDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<PetKindDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void insertProcess(PetKindDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateProcess(PetKindDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		dao.delete(chk);
	}

	@Override
	public PetKindDTO contentProcess(PetKindDTO dto) {
		// TODO Auto-generated method stub
		return dao.content(dto);
	}

	
	
}
