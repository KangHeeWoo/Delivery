package com.jhta.delivery.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.service.EventService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponVo;
import com.jhta.delivery.vo.EventEntryVo;
import com.jhta.delivery.vo.EventVo;

@Controller
public class AdminEventController {
	@Autowired private EventService service;
	@Autowired private CouponService couService;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping("/admin/event")
	public String eventManage(@RequestParam(name="pageNum", defaultValue="1")int pageNum, Model model) {
		int getCount = service.getCount();
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<EventVo> list = service.eventList(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("event", list);
		
		return ".admin.event";
	}
	
	@RequestMapping(value="/admin/addEvent", method=RequestMethod.GET)
	public String addEvent() {
		return ".admin.addEvent";
	}
	
	@RequestMapping(value="/admin/addEvent", method=RequestMethod.POST)
	public String addEventOk(EventVo vo, MultipartFile img, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath("/resources/images/event");
		String orgFileName = img.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		vo.setEve_img(saveFileName);
		
		try {
			InputStream is = img.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			
			service.addEvent(vo);
						
			return "redirect:/admin/event";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/admin/event";
		}		
	}
	
	@RequestMapping("/admin/detailevent")
	public String detailEvent(int num, Model model, @RequestParam(value="pageNum", defaultValue="1")int pageNum) {
		EventVo vo = service.detailEvent(num);
		
		vo.setEve_cont(vo.getEve_cont().replaceAll("\n", "<br>"));
		
		int getCount = service.getEntCount(num);
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("num", num);
		
		List<EventEntryVo> list = service.entryList(map);
		List<CouponVo> cou_list = couService.allCouponList();
		
		model.addAttribute("pu", pu);
		model.addAttribute("cou_list", cou_list);
		model.addAttribute("event", vo);
		model.addAttribute("entry", list);
		
		return ".admin.detailEvent";
	}
	
	@RequestMapping("/admin/winpro")
	public String eventWin(int num, int win_pro, int win_cnt) {
		Random random = new Random();
		int getCount = service.getEntCount(num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", 1);
		map.put("endRow", getCount);
		map.put("num", num);
		
		List<EventEntryVo> list = service.entryList(map);
		ArrayList<Integer> winList = new ArrayList<Integer>();
		List<Integer> winNum = new ArrayList<Integer>();
		
		for(int i=0;i<win_cnt;i++) {
			int rnd = random.nextInt(list.size());
			boolean check = true;
			
			for(int j=0;j<winList.size();j++) {
				
				if(winList.get(j) == rnd) {
					check = false;
					i--;
				}
			}
			
			if(check) winList.add(rnd);
		}
		
		for(int i=0;i<win_cnt;i++) {
			winNum.add(list.get(winList.get(i)).getEve_ent_num());
		}
		
		HashMap<String, Object> winMap = new HashMap<String, Object>();
		
		winMap.put("winNum", winNum);
		winMap.put("eve_num", num);
		
		service.winProsess(winMap);
		service.loseProsess(winMap);
		
		Calendar now = Calendar.getInstance();
		Calendar next = Calendar.getInstance();
		next.set(Calendar.MONTH, next.get(Calendar.MONTH) + 1);
		
		for(int i=0;i<win_cnt;i++) {
			couService.issueCoupon(new CouponIssueVo(0, win_pro, list.get(winList.get(i)).getMem_num(), now.getTime(), next.getTime(), null, null,0));
		}
		
		return "redirect:/admin/detailevent?num="+num;
	}
}
