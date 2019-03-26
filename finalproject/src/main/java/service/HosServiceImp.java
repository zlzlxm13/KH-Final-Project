package service;

import java.util.HashMap;
import java.util.List;

import dao.HosmapDAO;
import dto.HosmapDTO;


public class HosServiceImp implements HosService {
	private HosmapDAO dao;
	
	public HosServiceImp() {
		
	}
	
	public void setDao(HosmapDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<HosmapDTO> f_listProcess(int pageNo, int pageSize, String keyword) {
		HashMap<String, Object> map = 
				new HashMap<String, Object>();
		map.put("Startpage", ((pageNo - 1) * pageSize) + 1);
		map.put("Endpage", pageNo * pageSize);
		map.put("keyword", keyword);
		return dao.hos_list(map);
	}

	@Override
	public int f_countAllProcess(String data) {
		return dao.hos_countAll(data);
	}
	
}//end class
