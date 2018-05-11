package com.jhta.delivery.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.AbleLocationVo;
import com.jhta.delivery.vo.MenuVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class SellerController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private SellerService service;
	@Autowired private StoresService service1;
	
	@RequestMapping("/seller/main")
	public String main() {
		return ".seller";
	}
	
	@RequestMapping(value="/seller",method=RequestMethod.GET)
	public String join() {
		return ".seller.join";
	}


	@RequestMapping(value="/seller/join",method=RequestMethod.POST)
		public String insert(SellerVo vo, String sel_addr2) {
			String sel_addr=vo.getSel_addr()+sel_addr2;
			vo.setSel_addr(sel_addr);
			
			service.insert(vo);
			
			return ".main";
		}
	
	
	
	@RequestMapping(value="/seller/email",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String sel_email, String email_num) {
		System.out.println("email:"+sel_email+",email_num:"+email_num);
		JSONObject ob=new JSONObject();

		int m=service.emailcheck(sel_email);
		if(m<0) {
			boolean n=simpleMailSender.sendMail("¹è´ÞÀÇ ¹é¼ºÚÅ ÀÎÁõ", "¾È³çÇÏ¼¼¿ä. »çÀå´Ô \n ÀÎÁõ¹øÈ£¸¦ °¡ÀÔ¶õ¿¡ ÀÔ·ÂÇØÁÖ¼¼¿ä.\n"+ email_num , sel_email, "deliveryjhta@gmail.com");
			
			ob.put("result", n);
			
		}else {
			ob.put("result", false);
		}

		return ob.toString();
	}
	
	@RequestMapping("/stManage")
	public String stManage() {
		return ".seller.manageIndex";
	}
	
	@RequestMapping("/stAdd")
	public String stAdd() {
		return ".seller.stInsert";
	}
	@RequestMapping("/stInsert")
	public String stInsert(String sto_name,String sto_regnum,String sto_addr,String sto_phone,String sto_open,String sto_close,String sto_holiday,String sto_intro,int cat_num,HttpSession session,MultipartHttpServletRequest mhsr) {
		String email=(String)session.getAttribute("email");
		int sel_num=service.getSel_num(email);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("sto_name", sto_name);
		map.put("sto_regnum", sto_regnum);
		map.put("sto_addr", sto_addr);
		map.put("sto_phone", sto_phone);
		map.put("sto_open", sto_open);
		map.put("sto_close", sto_close);
		map.put("sto_holiday", sto_holiday);
		map.put("sto_intro", sto_intro);
		map.put("cat_num", cat_num);
		map.put("sel_num", sel_num);
		service1.stInsert(map);
		
		StoresVo vo=service1.stDetail2(sto_name);
		HashMap<String, Object> map1=new HashMap<String, Object>();
		
		String uploadPath=session.getServletContext().getRealPath("/resources/images/stores");
		try {
			MultipartFile mf=mhsr.getFile("sto_img");
			if(!mf.isEmpty()) {
				String orgFileName=mf.getOriginalFilename();
				String saveFileName=UUID.randomUUID()+"_"+orgFileName;
				InputStream is= mf.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+saveFileName);
				FileCopyUtils.copy(is, fos);
				fos.close();
				is.close();
				map1.put("sto_img", saveFileName);
				map1.put("sto_num", vo.getSto_num());
				service1.stImg(map1);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return ".seller.manageIndex";
	}
	@RequestMapping("/stList")
	public ModelAndView stList(HttpSession session) {
		String email=(String)session.getAttribute("email");
		int sel_num=service.getSel_num(email);
		List<StoresVo> list=service1.list(sel_num);
		ModelAndView mv=new ModelAndView(".seller.stList");
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping("/stDetail")
	public String stDetail(int sto_num,Model model,HttpSession session) {
		StoresVo vo=service1.stDetail(sto_num);
		session.setAttribute("sto_num", sto_num);
		model.addAttribute("vo",vo);
		return ".seller.stDetail";
	}
	@RequestMapping("/stUpdate")
	public String stUpdate(int sto_num,Model model) {
		StoresVo vo=service1.stDetail(sto_num);
		model.addAttribute("vo",vo);
		return ".seller.stUpdate";
	}
	@RequestMapping("/stUpdateOk")
	public String stUpdateOk(int sto_num,String sto_addr,String sto_phone,String sto_open,String sto_close,String sto_holiday,String sto_intro,int cat_num,HttpSession session,MultipartFile sto_img) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("sto_num", sto_num);
		map.put("sto_addr", sto_addr);
		map.put("sto_phone", sto_phone);
		map.put("sto_open", sto_open);
		map.put("sto_close", sto_close);
		map.put("sto_holiday", sto_holiday);
		map.put("sto_intro", sto_intro);
		map.put("cat_num", cat_num);
		String orgFileName=sto_img.getOriginalFilename();
		String saveFileName=service1.getImgName(sto_num);
		if(orgFileName.equals("")) {
			service1.stUpdate(map);
		}else {
			service1.stUpdate(map);
			String path=session.getServletContext().getRealPath("/resources/images/stores")+"\\"+saveFileName;
			File file1=new File(path);
			file1.delete();
			String updloadPath=session.getServletContext().getRealPath("/resources/images/stores");
			String saveFileName2=UUID.randomUUID()+"_"+orgFileName;
			try {
				InputStream is=sto_img.getInputStream();
				FileOutputStream fos=new FileOutputStream(updloadPath+"\\"+saveFileName2);
				FileCopyUtils.copy(is, fos);
				fos.close();
				is.close();
				HashMap<String, Object> map1=new HashMap<String, Object>();
				map1.put("sto_num", sto_num);
				map1.put("sto_img", saveFileName2);
				service1.imgUpdate(map1);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "redirect:/stList";
	}
	@RequestMapping("/stMenuIndex")
	public String stMenuIndex() {
		return ".seller.stMenuIndex";
	}
	@RequestMapping("/stMenu")
	public String stMenu() {
		return ".seller.stMenu";
	}
	@RequestMapping("/stMenuInsert")
	public String stMenuInsert(String[] men_name, int[] men_price,String[] men_state,HttpSession session) {
		int sto_num=(Integer)session.getAttribute("sto_num");
		for(int i=0;i<men_name.length;i++) {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("men_name", men_name[i]);
			map.put("men_price", men_price[i]);
			map.put("men_state", men_state[i]);
			map.put("sto_num", sto_num);
			service1.stMenuInsert(map);
		}
		return "redirect:/stMenuList";
	}
	@RequestMapping("/stMenuList")
	public String stMenuList(Model model,HttpSession session) {
		int sto_num=(Integer)session.getAttribute("sto_num");
		List<MenuVo> list=service1.stMenuList(sto_num);
		model.addAttribute("list",list);
		return ".seller.stMenuList";
	}
	@RequestMapping("/stMenuUpdate")
	public String stMenuUpdate(int[] men_num,int[] men_price,String[] men_state) {
		for(int i=0;i<men_num.length;i++) {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("men_num", men_num[i]);
			map.put("men_price", men_price[i]);
			map.put("men_state", men_state[i]);
			service1.stMenuUpdate(map);
		}
		return "redirect:/stMenuList";
	}
	@RequestMapping("/stMenuDelete")
	public String stMenuDelete(String men_name) {
		service1.stMenuDelete(men_name);
		return "redirect:/stMenuList";
	}
	@RequestMapping(value="/stRegnumCheck",produces="application/json;charset=utf-8")
	@ResponseBody
	public String stNameCheck(String sto_regnum) {
		String ck=service1.stRegnumCheck(sto_regnum);
		return ck;
	}

	@RequestMapping("/stDelete")
	public String stDelete(int sto_num) {
		service1.stDelete(sto_num);
		return "redirect:/stList";
	}
	@RequestMapping("/stLocation")
	public String stLocation(Model model,HttpSession session) {
		int sto_num=(Integer)session.getAttribute("sto_num");
		List<AbleLocationVo> list=service.stLocList(sto_num);
		model.addAttribute("list",list);
		return ".seller.stLocation";
	}
	@RequestMapping("/stLocInsert")
	public String stLocInsert(String able_loc,HttpSession session) {
		System.out.println("testtest");
		System.out.println("dd:"+able_loc);
		int sto_num=(Integer)session.getAttribute("sto_num");
		AbleLocationVo vo=new AbleLocationVo(0,able_loc,sto_num);
		service.stLocInsert(vo);
		return "redirect:/stLocation";
	}
	@RequestMapping("/stLocDelete")
	public String stLocDelete(int able_loc_num) {
		service.stLocDelete(able_loc_num);
		return "redirect:/stLocation";
	}
	@RequestMapping(value="/seller/information")
	public String information(HttpSession session,Model model) {
		String sel_email=(String)session.getAttribute("email");
		SellerVo vo=service.sel_num(sel_email);
		int sel_num=vo.getSel_num();
		SellerVo selDetail=service.searchMemNum(sel_num);
		model.addAttribute("selDetail", selDetail);
		
		return ".seller.myInformation";
	}
	@RequestMapping(value="/seller/password",produces="application/json;charset=utf-8")
	@ResponseBody
	public String password(HttpSession session,String Password) {
		System.out.println("ºñ¹øjson¿À´Ï");
		String sel_email=(String)session.getAttribute("email");
		SellerVo vo=service.sel_num(sel_email);
		int sel_num=vo.getSel_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("sel_pwd", Password);
		map.put("sel_num", sel_num);
		
		JSONObject ob=new JSONObject();
		int n=service.Password(map);
		System.out.println(n);
		//
		if(n>0) {
			ob.put("result", true);
			
		}else {
			ob.put("result", false);
		}
		return ob.toString();
	}
	//»çÀå´Ô Å»Åð
	@RequestMapping(value="/seller/delete")
	public String memDelete(HttpSession session,Model model) {
		String sel_email=(String)session.getAttribute("email");
		SellerVo vo=service.sel_num(sel_email);
		int sel_num=vo.getSel_num();
		model.addAttribute("sel_num", sel_num);
		
		return ".seller.selDelete";
	}
	//Å»Åð µî±Þ¼öÁ¤
	@RequestMapping(value="/seller/Sdelete")
	public String mDelete(HttpSession session,Model model,String sel_pwd) {
		String sel_email=(String)session.getAttribute("email");
		SellerVo vo=service.sel_num(sel_email);
		int sel_num=vo.getSel_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("sel_num", sel_num);
		map.put("sel_pwd", sel_pwd);
		int n=service.selGra(map);
		System.out.println("??"+n);
		if(n>0) {
			session.invalidate();
			return ".main";
		}else {
			String DD="pwdNo";
			return "redirect:/seller/delete?DD="+DD;
		}
	}
	//»çÀå´Ô ¾÷µ«
	@RequestMapping(value="/seller/selUpdate")
	public String memUpdate(HttpSession session,Model model,String sel_name,String sel_pwd,String sel_phone,String sel_addr,String sel_addr2 ) {
		System.out.println("¾÷µ«¿À´Ï?"+","+sel_name+","+sel_pwd+","+sel_phone+","+sel_addr+sel_addr2);
		String sel_addr3=sel_addr+sel_addr2;
		String sel_email=(String)session.getAttribute("email");
		SellerVo vo=service.sel_num(sel_email);
		int sel_num=vo.getSel_num();
		SellerVo Svo=new SellerVo(sel_num, null, sel_name, sel_pwd, sel_addr3, sel_phone, null, 0);
	
		int n=service.selUpdate(Svo);
		System.out.println("n"+n);
		
		return ".main";
	}
	@RequestMapping(value="/sellerChart",produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> sellerChart(int selyear,int selmonth,int md, HttpSession session, Model model) {
		int sto_num=(Integer)session.getAttribute("sto_num");
		int selyear1=selyear*10000;
		int selmonth1=selmonth*100;
		HashMap<String, Object> map=new HashMap<String, Object>();
		int date=0;
		int []a=new int[md+1];
		for(int i=1;i<=md;i++) {
			HashMap<String, Object> map1=new HashMap<String, Object>();
				date=(selyear1+selmonth1)+i;
				map1.put("date", date);
				map1.put("sto_num", sto_num);
				a[i]=service.getSal(map1);
		}
		map.put("a", a);
		map.put("year", selyear);
		map.put("month", selmonth);
		return map;
	}
	@RequestMapping("/stSal")
	public String stSal(@RequestParam(defaultValue="0")int year,@RequestParam(defaultValue="0")int month,HttpSession session, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Calendar cd = Calendar.getInstance();
		int md=0;
		if(year == 0 || month == 0) {
			year = cd.get(Calendar.YEAR);
			month = cd.get(Calendar.MONTH);
			md=cd.getActualMaximum(Calendar.DAY_OF_MONTH);
			month=month+1;
		}else {
		cd.set(Calendar.YEAR, year);
		cd.set(Calendar.MONTH, month-1);
		md=cd.getActualMaximum(Calendar.DAY_OF_MONTH);
		}
		map.put("selyear", year);
		map.put("selmonth", month);
		map.put("md",md);
		model.addAttribute("map",map);
		return".seller.stSal";
	}
}
