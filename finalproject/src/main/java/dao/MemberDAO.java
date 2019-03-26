package dao;

import java.util.List;

import dto.MemberDTO;

public interface MemberDAO {
	public int count();
	public List<MemberDTO> list();
	public void insert(MemberDTO dto);
	public void update(MemberDTO dto);
	public void delete(String[] chk);
	public MemberDTO content(MemberDTO dto);
	public int check(MemberDTO dto);
	
}
