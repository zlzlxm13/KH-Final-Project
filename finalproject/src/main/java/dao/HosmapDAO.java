package dao;

import java.util.HashMap;
import java.util.List;
import dto.HosmapDTO;

public interface HosmapDAO {
	public List<HosmapDTO> hos_list(HashMap<String, Object> map);

	public int hos_countAll(String data);
	
}//end interface
