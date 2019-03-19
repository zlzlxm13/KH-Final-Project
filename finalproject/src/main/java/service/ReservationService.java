package service;

import java.util.List;

import dto.ReservationDTO;


public interface ReservationService {
	public void saveProcess(ReservationDTO dto);
	public void r_listPorcess(ReservationDTO dto);
	public  List<ItemDTO>  itemSelectProcess();
	public List<String> pnameSelectProcess();
}//end interface
