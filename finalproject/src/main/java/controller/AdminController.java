package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.HosnameDAO;
import dto.HosmapDTO;
import dto.HosnameDTO;
import dto.HospitalDTO;
import dto.MemberDTO;
import dto.PetDTO;
import dto.PetKindDTO;
import dto.ReservationDTO;
import service.HosService;
import service.HosnameService;
import service.HospitalService;
import service.MemberService;
import service.PetKindService;
import service.PetService;
import service.ReservationService;

@Controller
public class AdminController {
	private HosService service;
	private PetService pservice;
	private PetKindService pkservice;
	private HospitalService hservice;
	private MemberService mservice;
	private ReservationService rservice;
	private HosnameService hnservice;

	public HosService getService() {
		return service;
	}

	public void setService(HosService service) {
		this.service = service;
	}

	public HosnameService getHnservice() {
		return hnservice;
	}

	public void setHnservice(HosnameService hnservice) {
		this.hnservice = hnservice;
	}

	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

	public MemberService getMservice() {
		return mservice;
	}

	public void setMservice(MemberService mservice) {
		this.mservice = mservice;
	}

	public ReservationService getRservice() {
		return rservice;
	}

	public void setRservice(ReservationService rservice) {
		this.rservice = rservice;
	}

	public PetService getPservice() {
		return pservice;
	}

	public void setPservice(PetService pservice) {
		this.pservice = pservice;
	}

	public PetKindService getPkservice() {
		return pkservice;
	}

	public void setPkservice(PetKindService pkservice) {
		this.pkservice = pkservice;
	}

	public HospitalService getHservice() {
		return hservice;
	}

	public void setHservice(HospitalService hservice) {
		this.hservice = hservice;
	}

	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	// insert
	@RequestMapping("/adminInsert.do")
	public ModelAndView adminInsertProcess(String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("petkind", pkservice.listProcess());
		mav.addObject("menu", menu);
		mav.setViewName("insert");
		return mav;
	}

	// member menu 1
	@RequestMapping("/adminMember.do")
	public ModelAndView adminMemberProcess(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(session.getAttribute("grade"));
		mav.addObject("menu", "1");
		mav.addObject("count", mservice.countProcess());
		mav.addObject("list", mservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminMemberInsert.do")
	public ModelAndView adminMemberInsertProcess(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "1");

		if (!dto.equals(null) || mservice.checkProcess(dto) == 0) {
			mservice.insertProcess(dto);
		}
		mav.addObject("count", mservice.countProcess());
		mav.addObject("list", mservice.listProcess());
		mav.setViewName("redirect:adminMember.do");
		return mav;
	}

	@RequestMapping("/adminMemberDelete.do")
	public ModelAndView adminMemberDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		System.out.println(chk[0]);
		mservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", mservice.countProcess());
		mav.addObject("list", mservice.listProcess());
		mav.setViewName("redirect:adminMember.do");
		return mav;
	}

	@RequestMapping("/adminMemberContent.do")
	public ModelAndView adminUpdateProcess(String menu, MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", mservice.contentProcess(dto));
		mav.addObject("menu", menu);
		mav.setViewName("update");
		return mav;
	}

	@RequestMapping("/adminMemberUpdate.do")
	public ModelAndView adminMemberUpdateProcess(String menu, MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		mservice.updateProcess(dto);
		mav.addObject("menu", menu);
		mav.addObject("count", mservice.countProcess());
		mav.addObject("list", mservice.listProcess());
		mav.setViewName("redirect:adminMember.do");
		return mav;

	}

	@RequestMapping("/adminBoard.do")
	public ModelAndView adminBoardProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "5");
		mav.setViewName("admin");
		return mav;

	}

	// pet menu 2
	@RequestMapping("/adminPet.do")
	public ModelAndView adminPetProcess(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "2");
		mav.addObject("count", pservice.countProcess());
		mav.addObject("list", pservice.listProcess());
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminPetInsert.do")
	public ModelAndView adminPetInsertProcess(PetDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.getPetname());
		mav.addObject("menu", "2");

		if (!dto.equals(null) || pservice.checkProcess(dto) == 0) {
			pservice.insertProcess(dto);
		}
		mav.addObject("count", pservice.countProcess());
		mav.addObject("list", pservice.listProcess());
		mav.setViewName("redirect:adminPet.do");
		return mav;
	}

	@RequestMapping("/adminPetDelete.do")
	public ModelAndView adminPetDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		System.out.println(chk[0]);
		pservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", pservice.countProcess());
		mav.addObject("list", pservice.listProcess());
		mav.setViewName("redirect:adminPet.do");
		return mav;
	}

	@RequestMapping("/adminPetContent.do")
	public ModelAndView adminUpdateProcess(String menu, PetDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", pservice.contentProcess(dto));
		mav.addObject("petkind", pkservice.listProcess());
		mav.addObject("menu", menu);
		mav.setViewName("update");
		return mav;
	}

	@RequestMapping("/adminPetUpdate.do")
	public ModelAndView adminPetUpdateProcess(String menu, PetDTO dto) {
		ModelAndView mav = new ModelAndView();
		pservice.updateProcess(dto);
		mav.addObject("menu", menu);
		mav.addObject("count", pservice.countProcess());
		mav.addObject("list", pservice.listProcess());
		mav.setViewName("redirect:adminPet.do");
		return mav;

	}

	// hospital menu 3

	@RequestMapping("/adminHospital.do")
	public ModelAndView adminHospitalProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "3");
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminHospitalInsert.do")
	public ModelAndView adminHospitalInsertProcess(HosmapDTO dto) {

		HospitalDTO hdto = new HospitalDTO(dto.getHosnum(), dto.getHosname(), dto.getPetkind_kind().split(" "),
				dto.getHosaddress(), dto.getHosarea(), dto.getLatitude(), dto.getLongitude());
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "3");
		if (!dto.equals(null) && hservice.checkProcess(dto) == 0) {
			hservice.insertProcess(hdto);
		}
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("redirect:adminHospital.do");
		return mav;
	}

	@RequestMapping("/adminHospitalDelete.do")
	public ModelAndView adminHospitalDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		hservice.deleteProcess(chk);
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("redirect:adminHospital.do");
		return mav;

	}

	@RequestMapping("/adminHospitalContent.do")
	public ModelAndView adminHospitalContentProcess(String menu, HosmapDTO dto) {
		System.out.println(hservice.contentProcess(dto).getHosaddress());
		ModelAndView mav = new ModelAndView();
		mav.addObject("petkind", pkservice.listProcess());
		mav.addObject("dto", hservice.contentProcess(dto));
		mav.addObject("menu", menu);
		mav.setViewName("update");
		return mav;
	}

	@RequestMapping("/adminHospitalUpdate.do")
	public ModelAndView adminHospitalUpdateProcess(String menu, HosmapDTO dto) {
		HospitalDTO hdto = new HospitalDTO(dto.getHosnum(), dto.getHosname(), dto.getPetkind_kind().split(" "),
				dto.getHosaddress(), dto.getHosarea(), dto.getLatitude(), dto.getLongitude());
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "3");

		hnservice.hosdeleteProcess(dto.getHosnum());
		for (String tmp : hdto.getPetkind_kind()) {
			HosnameDTO hndto = new HosnameDTO(dto.getHosnum(), tmp);
			hnservice.insertProcess(hndto);
		}
		hservice.updateProcess(dto);
		
		mav.addObject("menu", menu);
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("redirect:adminHospital.do");
		return mav;

	}

	// reservation menu 4
	@RequestMapping("/adminReservation.do")
	public ModelAndView adminReservationProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "4");
		mav.addObject("count", rservice.countProcess());
		mav.addObject("list", rservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminReservationInsert.do")
	public ModelAndView adminReservationInsertProcess(String rdate, ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "4");
		if (!dto.equals(null) && rservice.checkProcess(dto) == 0) {
			try {
				dto.setRes_date(transFormat.parse(rdate));
				System.out.println(dto.getPetpet());
				rservice.insertProcess(dto);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mav.addObject("count", rservice.countProcess());
		mav.addObject("list", rservice.listProcess());
		mav.setViewName("redirect:adminReservation.do");
		return mav;
	}

	@RequestMapping("/adminReservationDelete.do")
	public ModelAndView adminReservationDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		rservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", rservice.countProcess());
		mav.addObject("list", rservice.listProcess());
		mav.setViewName("redirect:adminReservation.do");
		return mav;

	}

	@RequestMapping("/adminReservationContent.do")
	public ModelAndView adminReservationContentProcess(String menu, ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", rservice.contentProcess(dto));
		mav.addObject("petkind", pkservice.listProcess());
		mav.addObject("menu", menu);
		mav.setViewName("update");
		return mav;
	}

	@RequestMapping("/adminReservationUpdate.do")
	public ModelAndView adminReservationUpdateProcess(String menu, String rdate, ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rdate);

		try {
			dto.setRes_date(transFormat.parse(rdate));
			rservice.insertProcess(dto);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rservice.updateProcess(dto);
		mav.addObject("menu", menu);
		mav.addObject("count", rservice.countProcess());
		mav.addObject("list", rservice.listProcess());
		mav.setViewName("redirect:adminReservation.do");
		return mav;

	}

	// petkind menu 6
	@RequestMapping("/adminPetKind.do")
	public ModelAndView adminPetKindProcess(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "6");
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminPetKindInsert.do")
	public ModelAndView adminPetKindInsertProcess(PetKindDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "6");
		if (!dto.equals(null) || pkservice.checkProcess(dto) == 0) {
			pkservice.insertProcess(dto);
		}
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("redirect:adminPetKind.do");
		return mav;
	}

	@RequestMapping("/adminPetKindDelete.do")
	public ModelAndView adminPetKindDeleteProcess(String menu, String[] chk) {
		System.out.println(chk[0]);
		ModelAndView mav = new ModelAndView();
		pkservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("redirect:adminPetKind.do");
		return mav;

	}

}
