package com.jhta.delivery.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.ReviewService;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.ReviewImageVo;
import com.jhta.delivery.vo.ReviewVo;

@Controller
public class ReviewController {
	@Autowired private ReviewService service;
	@Autowired private MembersService mservice;
	
	@RequestMapping(value="/review/insert", method=RequestMethod.POST)
	public String insertReview(int sto_num, int ord_num, int rating, String comment, MultipartHttpServletRequest mhsr, HttpSession session) {
		
		service.insertReview(new ReviewVo(0, "", comment, 
				0, null, rating, ord_num,  //주문번호 유효성 검사에서 불러오기
				0, null, null, null));
		
		int revNum = service.getMaxNum();
		
		String uploadPath = session.getServletContext().getRealPath("/resources/images/review");
		
		try {
			List<MultipartFile> fileList = mhsr.getFiles("file");
			
			if(!fileList.isEmpty()) {
				for(int i=0;i<fileList.size();i++) {
					String orgFileName = fileList.get(i).getOriginalFilename();
					String saveFileName = UUID.randomUUID() + "_" + orgFileName;
					
					InputStream is = fileList.get(i).getInputStream();
					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
					FileCopyUtils.copy(is, fos);
					
					service.insertImage(new ReviewImageVo(0, saveFileName, revNum));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/menu/menu?sto_num=" + sto_num;
		}
		
		return "redirect:/menu/menu?sto_num=" + sto_num;
	}
	
	@RequestMapping("/review/checkOrderList")
	@ResponseBody
	public String checkOrderList(int sto_num, HttpSession session) {
		String mem_email = (String)session.getAttribute("email");
		MembersVo mvo = mservice.getinfo(mem_email); 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("sto_num", sto_num);
		map.put("mem_num", mvo.getMem_num());
		
		OrdersVo ovo = service.getOrder(map); 

		JSONObject ob = new JSONObject();
		
		ob.put("result", false);
		
		if(ovo != null) {
			ob.put("result", true);
			ob.put("ord_num", ovo.getOrd_num());
		}
		
		return ob.toString();
	}
}
