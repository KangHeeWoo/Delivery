package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersUsePointVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.UsePointVo;

@Controller
public class MembersController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private MembersService service;
	@Autowired private CouponService couponService;
	@Autowired private BookMarkService bservice;
	@Autowired private OrdersService oservice;
	@Autowired private UsePointService usePservice;
	@Autowired private SellerService sellerService;
	@Autowired private EventService Eservice;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping(value="/members",method=RequestMethod.GET)
	public String join() {
		return ".members.join";
	}
	
	@RequestMapping("/members/bookmark")
	public String bookmark(HttpSession session,Model model,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		int totalRowCount=bservice.getCount(mem_num);
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
			
		
		List<StoresVo> list=bservice.booklist(map);
		model.addAttribute("booklist", list);
		model.addAttribute("pu", pu);
		
		return ".members.bookmark";
	}
	@RequestMapping(value="/members/bookDel")
	public String bookDel(int sto_num,HttpSession session) {
		System.out.println("stoNUm"+sto_num);
		String mem_email=(String)session.getAttribute("email");
		MembersVo memvo=service.mem_num(mem_email);
		int mem_num=memvo.getMem_num();
		
		System.out.println(mem_num);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("sto_num",sto_num);
		
		System.out.println(map);
		
		bservice.bookDel(map);
		return "redirect:/members/bookmark";
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String insert(MembersVo vo, String mem_addr2) {
		String mem_addr=vo.getMem_addr()+mem_addr2;
		vo.setMem_addr(mem_addr);
		
		service.insert(vo);
		
		MembersVo mem = couponService.searchMem(vo.getMem_email());
		Calendar today = Calendar.getInstance();
		Calendar nextMon = Calendar.getInstance();
		
		nextMon.set(Calendar.MONTH, today.get(Calendar.MONTH) + 1);
		
		couponService.issueCoupon(new CouponIssueVo(0, 41, mem.getMem_num(), today.getTime(), nextMon.getTime(), null, null,0));
		
		return ".main";
	}
	
	@RequestMapping(value="/member/email",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String mem_email, String email_num) {
		System.out.println("email:"+mem_email+",email_num:"+email_num);
		JSONObject ob=new JSONObject();

		int m=service.emailcheck(mem_email);
		if(m<0) {
			boolean n=simpleMailSender.sendMail("배달의 백성民 인증", "인증번호를 가입란에 입력해주세요.\n"+ email_num , mem_email, "deliveryjhta@gmail.com");
			System.out.println("메일갓니"+n);
			
			ob.put("result", n);
			
		}else {
			ob.put("result", false);
		}

		return ob.toString();
	}
	@RequestMapping(value="/member/nick",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String inputNick) {
		System.out.println("inputNick:"+inputNick);
		JSONObject ob=new JSONObject();

		int m=service.nickcheck(inputNick);
		if(m<0) ob.put("result",true);
		else ob.put("result", false);
	
		return ob.toString();
	}
	
	@RequestMapping("/members/orderlist")
	public String orderList(@RequestParam(name="pageNum", defaultValue="1")int pageNum, 
			HttpSession session, Model model, String requestPay, @RequestParam(name="stoNum", defaultValue="-1")int stoNum) {
		String email = (String)session.getAttribute("email");
		
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
		if(requestPay != null) {
			SellerVo svo = sellerService.getSellerInfo(stoNum);
			model.addAttribute("seller_email", svo.getSel_email());
		}
		
		return ".members.orderList";
	}
	//myPont
	@RequestMapping("/members/pointlist")
	public String pointlist(HttpSession session,Model model,@RequestParam(value="pageNum",defaultValue="1")int pageNum,@RequestParam(value="use_pageNum",defaultValue="1")int use_pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		int getCount = oservice.getMembersOrderCnt(mem_num);
		int usegetCount= usePservice.usegetCount(mem_num); 
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		PageUtil usepu = new PageUtil(pageNum, 10, 10, usegetCount);
		
		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("use_startRow",usepu.getStartRow());
		map.put("use_endRow",usepu.getEndRow());
		
		//List<UsePointVo> useVo=usePservice.usePoint(map);
		
		List<OrdersVo> pointlist=oservice.pointlist(map);
		//System.out.println(pointlist+"pointlilst");
		List<OrdersUsePointVo> usepointlist=usePservice.ordUsePoint(map);
		
		int mypoint=usePservice.mypoint(mem_num);
		
		model.addAttribute("pointlist", pointlist);
		model.addAttribute("pu", pu);
		model.addAttribute("usepu", usepu);
		model.addAttribute("usepointlist", usepointlist);
		model.addAttribute("mypoint", mypoint);
		//model.addAttribute("usePvo", useVo);
		
		return ".members.mypoint";
	}
	
	@RequestMapping("/members/couponlist")
	public String couponlist(HttpSession session,Model model,@RequestParam(value="CpageNum",defaultValue="1")int CpageNum,@RequestParam(value="Cuse_pageNum",defaultValue="1")int Cuse_pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		int CgetCount=couponService.myCcount(mem_num);
		
		PageUtil pu = new PageUtil(CpageNum, 10, 10, CgetCount);
		
		map.put("mem_num", mem_num);
		map.put("CstartRow", pu.getStartRow());
		map.put("CendRow", pu.getEndRow());
		
		List<CouponIssueVo> mycoupon=couponService.mycoupon(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("mycoupon", mycoupon);
		return ".members.mycoupon";
	}
	@RequestMapping("/members/eventlist")
	public String memElist(HttpSession session,Model model,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		int getCount=service.memEcount(mem_num);
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<EventListVo> list=service.memElist(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		return ".members.memElist";
	}
	@RequestMapping(value="/member/eventMem",produces="application/json;charset=utf-8")
	@ResponseBody
	public String eventMem(int eve_num,HttpSession session) {
		System.out.println("json오니");
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("eve_num", eve_num);
		map.put("mem_num", mem_num);
		
		JSONObject ob=new JSONObject();
		int n=service.eventMem(map);
		System.out.println(n);
		//
		if(n<=0) {
			//이벤트 신청하기
			int m=Eservice.eventEntry(map);
			System.out.println("이벤트신청가능유무"+m);
			if(m>0) ob.put("result", true);
			
		}else {
			System.out.println("json오니2");
			ob.put("result", false);
		}

		return ob.toString();
	}
}
