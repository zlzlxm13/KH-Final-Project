package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.HosmapDAO;
import dao.PetKindDAO;
import dto.PetKindDTO;
import service.HosService;
import service.LoginService;
import service.PetKindService;

@Controller
public class AdminController {
	private PetKindService pkservice;

	public PetKindService getPkservice() {
		return pkservice;
	}

	public void setPkservice(PetKindService pkservice) {
		this.pkservice = pkservice;
	}

	private HosService hservice;

	public HosService getHservice() {
		return hservice;
	}

	public void setHservice(HosService hservice) {
		this.hservice = hservice;
	}

	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/adminMember.do")
	public ModelAndView adminMemberProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "1");
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminPet.do")
	public ModelAndView adminPetProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "2");
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminHospital.do")
	public ModelAndView adminHospitalProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "3");
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminReservation.do")
	public ModelAndView adminReservationProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "4");
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminBoard.do")
	public ModelAndView adminBoardProcess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "5");
		mav.setViewName("admin");
		return mav;

	}

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
		System.out.println(pkservice.contentProcess(dto).equals(""));
		if (!dto.equals(null) ) {
			pkservice.insertProcess(dto);
		}
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminInsert.do")
	public ModelAndView adminInsertProcess(String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", menu);
		mav.setViewName("insert");
		return mav;

	}

	@RequestMapping("/adminPetKindDelete.do")
	public ModelAndView adminPetKindDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		System.out.println(chk[0]);
		pkservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminPetKindUpdate.do")
	public ModelAndView adminPetKindUpdateProcess(String menu, PetKindDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(menu);
		mav.addObject("menu", menu);
		mav.addObject("dto", dto);
		mav.setViewName("update");
		System.out.println(dto.getKind());
		return mav;

	}

}
