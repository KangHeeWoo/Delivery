package com.jhta.delivery.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.MainAdsVo;
import com.jhta.delivery.vo.TopAdsVo;

@Controller
public class AdsController {
	@Autowired
	private SellerService service;

	@RequestMapping("/topAds")
	public String topAds(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		int sto_num = (Integer) session.getAttribute("sto_num");
		int totalRowCount = service.getTopCount(sto_num);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("sto_num", sto_num);
		List<TopAdsVo> list = service.topList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".seller.topAdsList";
	}

	@RequestMapping("/topAdsInsert")
	public String topAdsInsert() {
		return ".seller.topAdsInsert";
	}

	@RequestMapping("/topAdsInsertOk")
	public String topAdsInsertOk(HttpSession session, int adsMonth, MultipartFile topAds_img) {
		int sto_num = (Integer) session.getAttribute("sto_num");
		Calendar cd = Calendar.getInstance();
		int year = cd.get(Calendar.YEAR) * 10000;
		cd.set(Calendar.MONTH, adsMonth);
		int md = cd.getActualMaximum(Calendar.DAY_OF_MONTH);
		adsMonth = (adsMonth + 1) * 100;
		int startDay = year + adsMonth + 1;
		int endDay = year + adsMonth + md;
		String orgFileName = topAds_img.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		String uploadPath = session.getServletContext().getRealPath("/resources/images/stores");
		try {
			InputStream is = topAds_img.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sto_num", sto_num);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			map.put("topAds_img", saveFileName);
			service.topAdsInsertOk(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/topAds";
	}

	@RequestMapping("/mainAds")
	public String mainAds(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		int sto_num = (Integer) session.getAttribute("sto_num");
		int totalRowCount = service.getMainCount(sto_num);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("sto_num", sto_num);
		List<MainAdsVo> list = service.mainList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".seller.mainAdsList";
	}

	@RequestMapping("/mainAdsInsert")
	public String mainAdsInsert() {
		return ".seller.mainAdsInsert";
	}

	@RequestMapping("/mainAdsInsertOk")
	public String mainAdsInsertOk(HttpSession session, int adsMonth, int main_ads_price, MultipartFile mainAds_img) {
		int sto_num = (Integer) session.getAttribute("sto_num");
		Calendar cd = Calendar.getInstance();
		int year = cd.get(Calendar.YEAR) * 10000;
		cd.set(Calendar.MONTH, adsMonth);
		int md = cd.getActualMaximum(Calendar.DAY_OF_MONTH);
		adsMonth = (adsMonth + 1) * 100;
		int startDay = year + adsMonth + 1;
		int endDay = year + adsMonth + md;
		String orgFileName = mainAds_img.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		String uploadPath = session.getServletContext().getRealPath("/resources/images/stores");
		try {
			InputStream is = mainAds_img.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sto_num", sto_num);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			map.put("mainAds_img", saveFileName);
			map.put("main_ads_price", main_ads_price);
			service.mainAdsInsertOk(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/mainAds";
	}
}
