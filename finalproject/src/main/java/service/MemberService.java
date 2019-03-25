package service;

import java.util.List;

import dto.MemberDTO;

public interface MemberService {
	public int countProcess();
	public List<MemberDTO> listProcess();
	public void insertProcess(MemberDTO dto);
	public void updateProcess(MemberDTO dto);
	public void deleteProcess(String[] chk);
	public MemberDTO contentProcess(MemberDTO dto);
	public int checkProcess(MemberDTO dto);
}
