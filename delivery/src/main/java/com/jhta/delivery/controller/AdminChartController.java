package com.jhta.delivery.controller;

import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.service.ChartService;

@Controller
public class AdminChartController {
	@Autowired private ChartService service;
	@RequestMapping(value="/adminchart",produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> Chart(int selyear,int selmonth,int md) {
		int selyear1=selyear*10000;
		int selmonth1=selmonth*100;
		HashMap<String, Object> map=new HashMap<String, Object>();
		int date=0;
		int []a=new int[md+1];
		int []b=new int[md+1];
		int []c=new int[md+1];
	
		for(int i=1;i<=md;i++) {
				date=(selyear1+selmonth1)+i;
				a[i]=service.getFee(date);
				b[i]=service.getMainFee(date);
				c[i]=service.getTopFee(date);
		}
		map.put("a", a);
		map.put("b", b);
		map.put("c", c);
		map.put("year", selyear);
		map.put("month", selmonth);
		return map;
	}
	@RequestMapping("/chart")
	public ModelAndView Chart1(@RequestParam(defaultValue="0")int year,@RequestParam(defaultValue="0")int month) {
		ModelAndView mv=new ModelAndView("admin/chart");
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
		mv.addObject("map",map);
		return mv;
	}
}
