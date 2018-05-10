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
   @Autowired private StoresService service;
   @Autowired private TopAdsService tservice;
   
   @RequestMapping(value="/searchAddr",produces="application/json;charset=utf-8")
   @ResponseBody
   public String searchAddr(HttpSession session) {
      JSONObject ob=new JSONObject();
      try {
         ob.put("result", true);
         ob.put("able_loc",session.getAttribute("able_loc"));
         //System.out.println("@.@"+session.getAttribute("able_loc"));   
      }catch(Exception e) {
         e.printStackTrace();
         ob.put("result", false);
      }         
      return ob.toString();
   }
   
   @RequestMapping("/myposition")
   public String myPositionList(@RequestParam(value="pageNum",defaultValue="1")int pageNum, int cat_num,String able_loc,String myDetail,Model model,HttpSession session) {
      session.setAttribute("able_loc", able_loc);
      session.setAttribute("myDetail", myDetail);
      
      String category = null;
      
      switch(cat_num) {
      case 1:
    	  category = "한식";
    	  break;
      case 2:
    	  category = "분식";
    	  break;
      case 3:
    	  category = "일식";
    	  break;
      case 4:
    	  category = "치킨";
    	  break;
      case 5:
    	  category = "피자";
    	  break;
      case 6:
    	  category = "중국집";
    	  break;
      case 7:
    	  category = "족발,보쌈";
    	  break;
      case 8:
    	  category = "야식";
    	  break;
      case 9:
    	  category = "카페,디저트";
    	  break;
      case 10:
    	  category = "도시락";
    	  break;
      case 11:
    	  category = "패스트푸드";
    	  break;
      case 12:
    	  category = "찜,탕";
    	  break;
      }
      
      session.setAttribute("category", category);
      
      HashMap<String, Object> map1 = new HashMap<String, Object>();
      map1.put("able_loc", able_loc);
      map1.put("cat_num", cat_num);
      
      
      int getCount=service.getCount(map1);

      
      PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
      //System.out.println("pu.getEndRow():"+ pu.getEndRow());
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cat_num", cat_num);
      map.put("able_loc", able_loc);
      map.put("startRow", pu.getStartRow());
      map.put("endRow", pu.getEndRow());
      
      List<StoresVo> adsList = tservice.topAdsList(map);
      model.addAttribute("adsList",adsList);
      
      List<StoreslistVo> list=service.myPositionList(map);
      model.addAttribute("list",list);
      model.addAttribute("pu",pu);
      model.addAttribute("cat_num",cat_num);
      model.addAttribute("able_loc",able_loc);
      return ".map.mylist";
   }
   
   @RequestMapping("/chatorder/list")
   @ResponseBody
   public List<StoreslistVo> chatOrderList(int cat_num, String able_loc, String firstAddr, String lastAddr, HttpSession session){
      session.setAttribute("firstAddr", firstAddr);
      session.setAttribute("lastAddr", lastAddr);
      
      HashMap<String, Object> map1 = new HashMap<String, Object>();
      map1.put("able_loc", able_loc);
      map1.put("cat_num", cat_num);

      int getCount=service.getCount(map1);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cat_num", cat_num);
      map.put("able_loc", able_loc);
      map.put("startRow", 1);
      map.put("endRow", getCount);
      
      return service.myPositionList(map);
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
            System.out.println("myAddr세션세션");            
         }
      }catch(Exception e) {
         e.printStackTrace();
         ob.put("result", false);
      }      
      return ob.toString();
   }
}