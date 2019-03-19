package service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dto.MemDTO;

public interface LoginService {
public void insertMember(MemDTO dto);

public int idChkprocess(String id);

public int loginprocess(MemDTO dto, HttpSession Hsession);

public String idsearchprocess(MemDTO dto);

public String passearchprocess(MemDTO dto);


}

