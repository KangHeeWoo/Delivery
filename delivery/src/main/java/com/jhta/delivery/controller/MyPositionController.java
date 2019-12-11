package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.service.TopAdsService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.StoreslistVo;

@Controller
public class MyPositionController {
	@Autowired
	private StoresService service;
	@Autowired
	private TopAdsService tservice;

	@RequestMapping(value = "/searchAddr", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchAddr(HttpSession session) {
		JSONObject ob = new JSONObject();
		try {
			ob.put("result", true);
			ob.put("able_loc", session.getAttribute("able_loc"));
		} catch (Exception e) {
			e.printStackTrace();
			ob.put("result", false);
		}
		return ob.toString();
	}

	@RequestMapping("/myposition")
	public String myPositionList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, int cat_num, String able_loc, String myDetail, Model model, HttpSession session) {
		session.setAttribute("able_loc", able_loc);
		session.setAttribute("myDetail", myDetail);

		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("able_loc", able_loc);
		map1.put("cat_num", cat_num);

		int getCount = service.getCount(map1);

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat_num", cat_num);
		map.put("able_loc", able_loc);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<StoresVo> adsList = tservice.topAdsList(map);
		model.addAttribute("adsList", adsList);

		List<StoreslistVo> list = service.myPositionList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("cat_num", cat_num);
		model.addAttribute("able_loc", able_loc);
		return ".map.mylist";
	}

	@RequestMapping("/chatorder/list")
	@ResponseBody
	public List<StoreslistVo> chatOrderList(int cat_num, String able_loc, String firstAddr, String lastAddr, HttpSession session) {
		session.setAttribute("able_loc", able_loc);
		session.setAttribute("firstAddr", firstAddr);
		session.setAttribute("lastAddr", lastAddr);

		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("able_loc", able_loc);
		map1.put("cat_num", cat_num);

		int getCount = service.getCount(map1);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat_num", cat_num);
		map.put("able_loc", able_loc);
		map.put("startRow", 1);
		map.put("endRow", getCount);

		return service.myPositionList(map);
	}

	@RequestMapping(value = "/myAddr", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String myAddr(String searchAddr, HttpSession session) {
		JSONObject ob = new JSONObject();
		try {
			if (searchAddr != null && !searchAddr.equals("")) {
				session.setAttribute("searchAddr", searchAddr);
				ob.put("result", true);
				System.out.println("myAddr技记技记");
			}
		} catch (Exception e) {
			e.printStackTrace();
			ob.put("result", false);
		}
		return ob.toString();
	}
}