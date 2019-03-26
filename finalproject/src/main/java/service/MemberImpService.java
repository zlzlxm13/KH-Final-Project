package service;

import java.util.List;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberImpService implements MemberService{
	private MemberDAO dao;

	public MemberImpService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<MemberDTO> listProcess() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void insertProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteProcess(String[] chk) {
		// TODO Auto-generated method stub
		dao.delete(chk);
	}

	@Override
	public MemberDTO contentProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dao.content(dto));
		return dao.content(dto);
	}

	@Override
	public int checkProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.check(dto);
	}

	
	
}
