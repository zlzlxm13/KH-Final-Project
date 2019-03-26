package service;


import java.util.List;

import dao.ReservationDAO;
import dto.ReservationDTO;

public class ReservationServiceImp implements ReservationService {
	private ReservationDAO dao;

	public void setDao(ReservationDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<ReservationDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void insertProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		dao.delete(chk);
	}

	@Override
	public int checkProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return dao.check(dto);
	}

	@Override
	public ReservationDTO contentProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return dao.content(dto);
	}


}
