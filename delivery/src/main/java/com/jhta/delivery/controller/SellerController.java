package com.jhta.delivery.controller;





import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.StoresService;
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
			boolean n=simpleMailSender.sendMail("배달의 백성民 인증", "안녕하세요. 사장님 \n 인증번호를 가입란에 입력해주세요.\n"+ email_num , sel_email, "deliveryjhta@gmail.com");
			
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
	@RequestMapping("/stLocation")
	public String stLocation() {
		return ".seller.stLocation";
	}
	@RequestMapping("/stDelete")
	public String stDelete(int sto_num) {
		service1.stDelete(sto_num);
		return "redirect:/stList";
	}
}
