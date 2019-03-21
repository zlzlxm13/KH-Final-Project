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
		return rdao.search(member_id);
	}

	@Override
	public List<ReservationDTO> r_list() {
		return rdao.r_list();
	}



	@Override
	public List<ReservationDTO> r_deleteProcess(ReservationDTO dto) {
		rdao.r_delete(dto.getRes_num());
		return rdao.search(dto.getMember_id());
	}

}

	