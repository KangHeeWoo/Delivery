package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MyPositionController {
	@Autowired private StoresService service;
	
	/*@RequestMapping(value = "/myposition", method = RequestMethod.GET)
	public String myposition() {
		return ".map.myposition";
	}*/
	@RequestMapping("/myposition")
	public String myPositionList(int cat_num,String able_loc,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat_num", cat_num);
		map.put("able_loc", able_loc);
		List<StoresVo> list=service.myPositionList(map);
		model.addAttribute("list",list);
		return ".map.mylist";
	}
	@RequestMapping(value="/myAddr",produces="application/json;charset=utf-8")
	@ResponseBody
	public String myAddr(String searchAddr,HttpSession session) {
		JSONObject ob=new JSONObject();
		//System.out.println("searchAddr:"+searchAddr);
		try {
			if(searchAddr!=null && !searchAddr.equals("")) {
				session.setAttribute("searchAddr", searchAddr);
				ob.put("result", true);
				//System.out.println("myAddr技记技记");				
			}
		}catch(Exception e) {
			e.printStackTrace();
			ob.put("result", false);
		}		
		return ob.toString();
	}
	/*@RequestMapping(value="/addrsearch",method=RequestMethod.GET)
	public String join() {
		return ".map.addrsearch";
	}*/
}
