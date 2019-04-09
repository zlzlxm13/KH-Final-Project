package service;


import java.util.List;

import dao.ReservationDAO;
import dto.ReservationDTO;


public class ReservationServiceImp implements ReservationService {
	private ReservationDAO rdao;

	public ReservationServiceImp() {
	}

	
	public void setRdao(ReservationDAO rdao) {
		this.rdao = rdao;
	}

	@Override
	public void saveProcess(ReservationDTO dto) {
		rdao.save(dto);
	}

	@Override
	public List<ReservationDTO> search(String member_id) {
		return rdao.r_search(member_id);
	}

	
	@Override
	public List<ReservationDTO> r_deleteProcess(ReservationDTO dto) {
		rdao.r_delete(dto.getRes_num());
		return rdao.r_search(dto.getMember_id());
	}
	
	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return rdao.count();
	}
	
	@Override
	public ReservationDTO r_fsearch(int res_num) {
		return rdao.r_fsearch(res_num);
	}


	@Override
	public List<ReservationDTO> listProcess() {
		// TODO Auto-generated method stub
		return rdao.list();
	}

	@Override
	public void insertProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		rdao.insert(dto);
	}

	@Override
	public void updateProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		rdao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		rdao.delete(chk);
	}

	@Override
	public int checkProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return rdao.check(dto);
	}

	@Override
	public ReservationDTO contentProcess(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return rdao.content(dto);
	}


	@Override
	public List<ReservationDTO> r_list() {
		// TODO Auto-generated method stub
		return null;
	}


}
