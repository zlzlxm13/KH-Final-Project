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
		return null;
	}



	@Override
	public ReservationDTO r_fsearch(int res_num) {
		return rdao.r_fsearch(res_num);
	}



	@Override
	public void updateProcess(ReservationDTO dto) {
		rdao.r_update(dto);
	}

}

	