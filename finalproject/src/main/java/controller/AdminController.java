package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.HosmapDAO;
import dao.PetKindDAO;
import dto.HosmapDTO;
import dto.PetDTO;
import dto.PetKindDTO;
import service.HosService;
import service.LoginService;
import service.PetKindService;
import service.PetService;

@Controller
public class AdminController {
	private PetService pservice;

	public PetService getPservice() {
		return pservice;
	}

	public void setPservice(PetService pservice) {
		this.pservice = pservice;
	}

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

	@RequestMapping("/adminHosmap.do")
	public ModelAndView adminHosmapProcess() {
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
	@RequestMapping("/adminInsert.do")
	public ModelAndView adminInsertProcess(String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", menu);
		mav.setViewName("insert");
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
		if (!dto.equals(null) && pkservice.contentProcess(dto) == 0) {
			pkservice.insertProcess(dto);
		}
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminPetKindDelete.do")
	public ModelAndView adminPetKindDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		pkservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", pkservice.countProcess());
		mav.addObject("list", pkservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminPetKindUpdate.do")
	public ModelAndView adminPetKindUpdateProcess(String menu, String ckind, PetKindDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(ckind);
		mav.addObject("menu", menu);
		mav.addObject("dto", dto);
		mav.setViewName("update");
		System.out.println(dto.getKind());
		return mav;

	}
	
	
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
		mav.addObject("menu", "6");
		if (!dto.equals(null) && pservice.contentProcess(dto) == 0) {
			pservice.insertProcess(dto);
		}
		mav.addObject("count", pservice.countProcess());
		mav.addObject("list", pservice.listProcess());
		mav.setViewName("admin");
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
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminPetUpdate.do")
	public ModelAndView adminPetUpdateProcess(String menu, PetDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(menu);
		mav.addObject("menu", menu);
		mav.addObject("dto", dto);
		mav.setViewName("update");
		return mav;

	}
	
	
	@RequestMapping("/adminHosmapInsert.do")
	public ModelAndView adminHosmapInsertProcess(HosmapDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "6");
		if (!dto.equals(null)) {

		}
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminHosmapDelete.do")
	public ModelAndView adminHosmapDeleteProcess(String menu, String[] chk) {
		ModelAndView mav = new ModelAndView();
		System.out.println(chk[0]);
		pservice.deleteProcess(chk);
		mav.addObject("menu", menu);
		mav.addObject("count", hservice.countProcess());
		mav.addObject("list", hservice.listProcess());
		mav.setViewName("admin");
		return mav;

	}

	@RequestMapping("/adminHosmapUpdate.do")
	public ModelAndView adminHosmapUpdateProcess(String menu, HosmapDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(menu);
		mav.addObject("menu", menu);
		mav.addObject("dto", dto);
		mav.setViewName("update");
		return mav;

	}
	
	

}
