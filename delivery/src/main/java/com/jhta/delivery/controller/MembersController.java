package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.BookMarkService;
import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.service.EventService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.OrdersService;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.UsePointService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.EventListVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrdersUsePointVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MembersController {
	@Autowired
	private SimpleMailSender simpleMailSender;
	@Autowired
	private MembersService service;
	@Autowired
	private CouponService couponService;
	@Autowired
	private BookMarkService bservice;
	@Autowired
	private OrdersService oservice;
	@Autowired
	private UsePointService usePservice;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private EventService Eservice;

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

	@RequestMapping(value = "/members", method = RequestMethod.GET)
	public String join() {
		return ".members.join";
	}

	@RequestMapping("/members/bookmark")
	public String bookmark(HttpSession session, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();

		int totalRowCount = bservice.getCount(mem_num);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<StoresVo> list = bservice.booklist(map);
		model.addAttribute("booklist", list);
		model.addAttribute("pu", pu);

		return ".members.bookmark";
	}

	@RequestMapping(value = "/members/bookDel")
	public String bookDel(int sto_num, HttpSession session) {

		String mem_email = (String) session.getAttribute("email");
		MembersVo memvo = service.mem_num(mem_email);
		int mem_num = memvo.getMem_num();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("sto_num", sto_num);

		bservice.bookDel(map);
		return "redirect:/members/bookmark";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insert(MembersVo vo, String mem_addr2) {
		String mem_addr = vo.getMem_addr() + mem_addr2;
		vo.setMem_addr(mem_addr);

		service.insert(vo);

		MembersVo mem = couponService.searchMem(vo.getMem_email());
		Calendar today = Calendar.getInstance();
		Calendar nextMon = Calendar.getInstance();

		nextMon.set(Calendar.MONTH, today.get(Calendar.MONTH) + 1);

		couponService.issueCoupon(
				new CouponIssueVo(0, 41, mem.getMem_num(), today.getTime(), nextMon.getTime(), null, null, 0));

		return ".main";
	}

	@RequestMapping(value = "/member/email", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String email(String mem_email, String email_num) {

		JSONObject ob = new JSONObject();

		int m = service.emailcheck(mem_email);
		if (m < 0) {
			boolean n = simpleMailSender.sendMail("배달의 백성民 인증", "인증번호를 가입란에 입력해주세요.\n" + email_num, mem_email,
					"deliveryjhta@gmail.com");

			ob.put("result", n);

		} else {
			ob.put("result", false);
		}

		return ob.toString();
	}

	@RequestMapping(value = "/member/nick", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String email(String inputNick) {

		JSONObject ob = new JSONObject();

		int m = service.nickcheck(inputNick);
		if (m < 0)
			ob.put("result", true);
		else
			ob.put("result", false);

		return ob.toString();
	}

	@RequestMapping("/members/orderlist")
	public String orderList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session,
			Model model, String requestPay, @RequestParam(name = "stoNum", defaultValue = "-1") int stoNum) {
		String email = (String) session.getAttribute("email");

		MembersVo vo = service.getinfo(email);

		int getCount = oservice.getMembersOrderCnt(vo.getMem_num());

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memNum", vo.getMem_num());
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<OrdersVo> list = oservice.getMembersOrder(map);

		model.addAttribute("pu", pu);
		model.addAttribute("order", list);
		model.addAttribute("requestPay", requestPay);
		if (requestPay != null) {
			SellerVo svo = sellerService.getSellerInfo(stoNum);
			model.addAttribute("seller_email", svo.getSel_email());
		}

		return ".members.orderList";
	}

	// myPont
	@RequestMapping("/members/pointlist")
	public String pointlist(HttpSession session, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "use_pageNum", defaultValue = "1") int use_pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();

		int getCount = oservice.getMembersOrderCnt(mem_num);
		int usegetCount = usePservice.usegetCount(mem_num);

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		PageUtil usepu = new PageUtil(use_pageNum, 10, 10, usegetCount);

		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("use_startRow", usepu.getStartRow());
		map.put("use_endRow", usepu.getEndRow());

		// List<UsePointVo> useVo=usePservice.usePoint(map);

		List<OrdersVo> pointlist = oservice.pointlist(map);
		List<OrdersUsePointVo> usepointlist = usePservice.ordUsePoint(map);

		int mypoint = usePservice.mypoint(mem_num);

		model.addAttribute("pointlist", pointlist);
		model.addAttribute("pu", pu);
		model.addAttribute("usepu", usepu);
		model.addAttribute("usepointlist", usepointlist);
		model.addAttribute("mypoint", mypoint);
		// model.addAttribute("usePvo", useVo);

		return ".members.mypoint";
	}

	@RequestMapping("/members/couponlist")
	public String couponlist(HttpSession session, Model model,
			@RequestParam(value = "CpageNum", defaultValue = "1") int CpageNum,
			@RequestParam(value = "Cuse_pageNum", defaultValue = "1") int Cuse_pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();

		int CgetCount = couponService.myCcount(mem_num);

		PageUtil pu = new PageUtil(CpageNum, 10, 10, CgetCount);

		map.put("mem_num", mem_num);
		map.put("CstartRow", pu.getStartRow());
		map.put("CendRow", pu.getEndRow());

		List<CouponIssueVo> mycoupon = couponService.mycoupon(map);

		model.addAttribute("pu", pu);
		model.addAttribute("mycoupon", mycoupon);
		return ".members.mycoupon";
	}

	@RequestMapping("/members/eventlist")
	public String memElist(HttpSession session, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();

		int getCount = service.memEcount(mem_num);

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);

		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<EventListVo> list = service.memElist(map);

		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		return ".members.memElist";
	}

	@RequestMapping(value = "/member/eventMem", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String eventMem(int eve_num, HttpSession session) {
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eve_num", eve_num);
		map.put("mem_num", mem_num);

		JSONObject ob = new JSONObject();
		int n = service.eventMem(map);
		System.out.println(n);
		//
		if (n <= 0) {
			// 이벤트 신청하기
			int m = Eservice.eventEntry(map);
			if (m > 0)
				ob.put("result", true);

		} else {
			ob.put("result", false);
		}

		return ob.toString();
	}

	@RequestMapping(value = "/members/memUpdate")
	public String memUpdate(HttpSession session, Model model, String mem_name, String mem_pwd, String mem_nick,
			String mem_phone, String mem_addr, String mem_addr2) {
		System.out.println(
				"업뎃오니?" + "," + mem_name + "," + mem_pwd + "," + mem_nick + mem_phone + "," + mem_addr + mem_addr2);
		String mem_addr3 = mem_addr + mem_addr2;
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		MembersVo Mvo = new MembersVo(mem_num, null, mem_name, mem_pwd, null, mem_addr3, mem_phone, null, mem_nick,
				null, 0, 0);

		int n = service.memUpdate(Mvo);
		System.out.println("n" + n);

		return ".main";
	}

	// 회원탈퇴하기
	@RequestMapping(value = "/members/delete")
	public String memDelete(HttpSession session, Model model) {
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		model.addAttribute("mem_num", mem_num);

		return ".members.memDelete";
	}

	// 탈퇴 등급수정
	@RequestMapping(value = "/members/Mdelete")
	public String mDelete(HttpSession session, Model model, String mem_pwd) {
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("mem_pwd", mem_pwd);
		int n = service.memGra(map);
		String DD = "pwdNo";
		if (n >= 0) {
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/members/delete?DD=" + DD;
		}

	}

	@RequestMapping(value = "/members/information")
	public String information(HttpSession session, Model model) {
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		MembersVo memDetail = service.searchMemNum(mem_num);
		model.addAttribute("memDetail", memDetail);

		return ".members.myInformation";
	}

	@RequestMapping(value = "/member/password", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String password(HttpSession session, String Password) {
		String mem_email = (String) session.getAttribute("email");
		MembersVo vo = service.mem_num(mem_email);
		int mem_num = vo.getMem_num();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_pwd", Password);
		map.put("mem_num", mem_num);

		JSONObject ob = new JSONObject();
		int n = service.Password(map);

		//
		if (n > 0) {
			ob.put("result", true);

		} else {
			ob.put("result", false);
		}
		return ob.toString();
	}

	@RequestMapping(value = "/members/Find_pwd")
	public String Findpwd(HttpSession session, Model model) {
		return ".members.Findpwd";
	}

	// 비밀번호찾기 관련 controller
	@RequestMapping(value = "/member/emailCheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String emailCheck(String mem_email, String radiovalue) {
		JSONObject ob = new JSONObject();
		if (radiovalue.equals("mem_email")) {
			int m = service.emailcheck(mem_email);
			System.out.println("m" + m);
			if (m > 0) {
				ob.put("result", true);
			} else {
				ob.put("result", false);
			}
		} else if (radiovalue.equals("sel_email")) {

			int n = sellerService.emailcheck(mem_email);
			System.out.println("n" + n);
			if (n > 0) {
				ob.put("result", true);
			} else {
				ob.put("result", false);
			}
		}
		return ob.toString();
	}

	@RequestMapping(value = "/members/Pwd")
	public String Pwd(String mem_email, Model model) {
		String randomPwd = UUID.randomUUID() + "";
		String Pwd = randomPwd.substring(1, 11);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("mem_pwd", Pwd);

		simpleMailSender.sendMail("배달의 백성民 인증", "새로운 비밀번호 \n" + Pwd, mem_email, "deliveryjhta@gmail.com");

		int n = service.pwdUpdate(map);

		return ".main";

	}

	@RequestMapping(value = "/members/kakao", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String KakaoE(String kakaoEmail, HttpSession session) {
		JSONObject ob = new JSONObject();

		String mem_email = kakaoEmail;

		MembersVo vo = service.getinfo(mem_email);
		if (vo == null) {
			service.snsInsert(mem_email);
			ob.put("result", "회원가입");
			session.setAttribute("email", mem_email);
		} else {
			if (vo.getMem_sns().equals("아니요")) {
				ob.put("result", "alert");
			} else {
				if (vo.getMem_addr().equals(" ")) {
					ob.put("result", "회원정보수정");
					session.setAttribute("email", mem_email);
				} else {
					ob.put("result", "main");
					session.setAttribute("email", mem_email);
				}
			}
		}

		return ob.toString();

	}

}
