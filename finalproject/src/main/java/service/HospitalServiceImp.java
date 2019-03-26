package service;

import java.util.List;

import dao.HospitalDAO;
import dto.HosmapDTO;


public class HospitalServiceImp implements HospitalService {
	private HospitalDAO dao;
	
	public HospitalServiceImp() {
		
	}
	
	public void setDao(HospitalDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<HosmapDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}
	@Override
	public void insertProcess(HosmapDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateProcess(HosmapDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		dao.delete(chk);
	}

	@Override
	public int checkProcess(HosmapDTO dto) {
		// TODO Auto-generated method stub
		return dao.check(dto);
	}

	@Override
	public HosmapDTO contentProcess(HosmapDTO dto) {
		// TODO Auto-generated method stub
		return dao.content(dto);
	}


	
	
}//end class
