package com.jhta.delivery.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.service.BookMarkService;
import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.MenuService;
import com.jhta.delivery.service.ReviewService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.BookMarkVo;
import com.jhta.delivery.vo.CartVo;
import com.jhta.delivery.vo.MemCouponVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.MenuVo;
import com.jhta.delivery.vo.ReviewVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MenuController {
	@Autowired private StoresService service;
	@Autowired private MenuService Mservice;
	@Autowired private MembersService memservice;
	@Autowired private BookMarkService bservice;
	@Autowired private CouponService Cservice;
	@Autowired private ReviewService rservice;
	
	@RequestMapping("/menu/menu")
	public String admin(int sto_num,Model model, @RequestParam(name="pageNum", defaultValue="1")int pageNum) {
		StoresVo stovo=service.stoName(sto_num);
		
		List<MenuVo> menulist=Mservice.menulist(sto_num);
		
		int getCount = rservice.getCount(sto_num);
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("sto_num", sto_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<ReviewVo> review = rservice.getList(map);
		
		model.addAttribute("stovo", stovo);
		model.addAttribute("menulist", menulist);
		model.addAttribute("review", review);
		model.addAttribute("pu", pu);
		System.out.println(stovo.getSto_name()+"메뉴리스트:"+menulist);
		return ".menu.menu";
	}
	@RequestMapping("/menu/cart")
	public String cart(StoresVo stovo, HttpSession session, int[] num,String[] name,int[] price, int[] cnt,int total,Model model) {
		System.out.println("오니");
		System.out.println("stovo:"+stovo);
		stovo = service.stoName(stovo.getSto_num());
		String mem_email=(String)session.getAttribute("email");
		System.out.println("mem_email:" + mem_email);
		MembersVo vo=memservice.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		System.out.println(mem_num);
		List<MemCouponVo> memCoupon=Cservice.memCoupon(mem_num);
		MembersVo memPoint=memservice.memPoint(mem_num);
		
		ArrayList<CartVo> array = new ArrayList<CartVo>();
		System.out.println(memCoupon+"memCoupon"+array);
		
		for(int i=0;i<num.length;i++) {
			array.add(new CartVo(num[i], name[i], price[i], cnt[i]));
		}
		
		model.addAttribute("stovo", stovo);
		model.addAttribute("array", array);
		model.addAttribute("total", total);
		model.addAttribute("memCoupon", memCoupon);
		model.addAttribute("memPoint", memPoint);
		model.addAttribute("able_loc",(String)session.getAttribute("able_loc"));
		model.addAttribute("myDetail",(String)session.getAttribute("myDetail"));
		
		return ".menu.cart";
	}
	
	@RequestMapping(value="/menu/bookmark",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(int sto_num,HttpSession session) {

		JSONObject ob=new JSONObject();
		String mem_email=(String)session.getAttribute("email");
		
		MembersVo vo=memservice.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		//존재하는지 검사
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("sto_num", sto_num);
		int m=bservice.numCheck(map);
		if(m>0) {
			BookMarkVo bvo=new BookMarkVo(0, mem_num, sto_num);
			bservice.insert(bvo);
			ob.put("result", true);
		}else {
			ob.put("result", false);
		}
		return ob.toString();
	}

}
