package dao;

import java.util.List;

import dto.HospitalDTO;

public interface HospitalDAO {
	public int count();
	public HospitalDTO List(int num);
	public void update(HospitalDTO dto);
	public void delete(int num);
}
