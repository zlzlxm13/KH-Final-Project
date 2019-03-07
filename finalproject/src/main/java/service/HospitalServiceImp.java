package service;

import dao.HospitalDAO;
import dto.HospitalDTO;

public class HospitalServiceImp implements HospitalService{
	private HospitalDAO dao;
	
	public HospitalDAO getDao() {
		return dao;
	}

	public void setDao(HospitalDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HospitalDTO ListProcess(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProcess(HospitalDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProcess(int num) {
		// TODO Auto-generated method stub
		
	}

}
