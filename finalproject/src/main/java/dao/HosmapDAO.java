package dao;

import java.util.HashMap;
import java.util.List;

import dto.HosmapDTO;

public interface HosmapDAO {
	public List<HosmapDTO> lib_list(HashMap<String, Object> map);

	public int lib_countAll(String data);
}//end interface
