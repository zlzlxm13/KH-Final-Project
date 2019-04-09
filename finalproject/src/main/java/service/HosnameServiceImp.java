package service;

import java.util.List;

import dao.HosnameDAO;
import dto.HosnameDTO;
import dto.HospitalDTO;

public class HosnameServiceImp implements HosnameService {
	private HosnameDAO dao;

	public HosnameServiceImp() {

	}

	public void setDao(HosnameDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<HosnameDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public void insertProcess(HosnameDTO dto) {
		// TODO Auto-generated method stub

			dao.insert(dto);

	}

	@Override
	public void deleteProcess(HosnameDTO dto) {
		// TODO Auto-generated method stub
		dao.delete(dto);
	}

	@Override
	public int checkProcess(HosnameDTO dto) {
		// TODO Auto-generated method stub
		return dao.check(dto);
	}

	@Override
	public HosnameDTO contentProcess(HosnameDTO dto) {
		// TODO Auto-generated method stub
		return dao.content(dto);
	}

	@Override
	public void hosdeleteProcess(int hosnum) {
		// TODO Auto-generated method stub
		dao.hosdelete(hosnum);
	}
	
	

}// end class

