package com.jhta.delivery.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MyPositionController {
	@Autowired private StoresService service;
	
	@RequestMapping(value = "/myposition", method = RequestMethod.GET)
	public String myposition() {
		return ".map.myposition";
	}
	@RequestMapping(value = "/myposition", method = RequestMethod.POST)
	public ModelAndView myPositionList(String able_loc) {
		ModelAndView mv = new ModelAndView("map/mylist");
		List<StoresVo> list=service.myPositionList(able_loc);
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping(value="/myAddr",produces="application/json;charset=utf-8")
	@ResponseBody
	public String myAddr(String myAddr,HttpSession session) {
		JSONObject ob=new JSONObject();
		try {
			session.setAttribute("myAddr", myAddr);
			ob.put("result", true);
			//System.out.println("技记技记");
		}catch(Exception e) {
			e.printStackTrace();
			ob.put("result", false);
		}		
		return ob.toString();
	}
	@RequestMapping(value="/addrsearch",method=RequestMethod.GET)
	public String join() {
		return ".map.addrsearch";
	}
}
