package service;

import java.util.List;

import dto.HosmapDTO;

public interface HosService {
	public List<HosmapDTO> f_listProcess(
			int pageNo, int pageSize, 
			String keyword);

	public int f_countAllProcess(String data);
}//end Service
