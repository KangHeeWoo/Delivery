package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.service.MainAdsService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.vo.MainAdsVo;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class HomeController {
	@Autowired private MembersService memService;
	@Autowired private SellerService selService;
	@Autowired private MainAdsService adsService;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<MainAdsVo> list = adsService.mainAdsSelected();
		model.addAttribute("list",list);
		return ".main";
	}
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".join";
	}
	
	@RequestMapping(value="/login/emailcheck",produces="application/json;charset=utf-8")
	@ResponseBody
	public String emailCheck(String emailcheck) {
		JSONObject ob=new JSONObject();
		int n=memService.emailcheck(emailcheck);
		int m=selService.emailcheck(emailcheck);
		if(m>0 || n>0) {
			ob.put("result",true);
		}else {
			ob.put("result",false);
		
		}
		return ob.toString();
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃오니");
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypage(HttpSession session,Model model) {
		model.addAttribute("mem_email", session.getAttribute("email"));
		return ".members.mypage";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginOk(String joinradio,String email, String pwd,HttpSession session,boolean idcheckBox,HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, String> map=new HashMap<String, String>();
		//System.out.println(idcheckBox);
		
		
		if(idcheckBox) {
			//쿠키추가
			Cookie idCook=new Cookie("mem_email", email); //쿠키생성
			Cookie pwdCook=new Cookie("mem_pwd", pwd); //쿠키생성
			Cookie chk=new Cookie("chk", "check");
			idCook.setMaxAge(60*60*24); //쿠키기간 
			pwdCook.setMaxAge(60*60*24); //쿠키기간 하루
			chk.setMaxAge(60*60*24); //쿠키기간 하루
			response.addCookie(chk);
			response.addCookie(idCook);
			response.addCookie(pwdCook);
			
		}else {
			//모든 쿠키제거 - jsessionID 제외하고 제거
			Cookie[] cookies=request.getCookies();
			if(cookies!=null) {
				for(int i=0;i<cookies.length;i++) {
					if(cookies[i].getName().equals("mem_email") || cookies[i].getName().equals("mem_pwd") || cookies[i].getName().equals("chk")) {
						cookies[i].setMaxAge(0); //유효시간 0
						response.addCookie(cookies[i]); //응답헤더?
					}
				}
			}
		}
		
		int n=0;
		int m=0;
		if(joinradio.equals("mem_email") ) {
			map.put("mem_email", email);
			map.put("mem_pwd",pwd);
			n=memService.logincheck(map);
			System.out.println("n : " + n);
			if(n>0) {
				MembersVo vo = memService.getinfo(email);
				session.setAttribute("email", email);
				session.setAttribute("nick", vo.getMem_nick());
				
				if(email.equals("admin@admin")) return ".admin";
				
				return ".main";
			}
		}else if(joinradio.equals("sel_email")) {
			map.put("sel_email", email);
			map.put("sel_pwd",pwd);
			m=selService.logincheck(map);
			if(m>0) {
				session.setAttribute("email", email);
				return ".seller";
			}
		}
		
		return ".login";
	}
	@RequestMapping(value="/aa",method=RequestMethod.GET)
	public String loginOk1() {
		return ".seller";
	}
}
