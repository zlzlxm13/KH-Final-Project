package service;

import dto.MemDTO;

public interface LoginService {
public void insertMember(MemDTO dto);

public int idChkprocess(String id);
}
