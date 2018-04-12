package com.jhta.delivery.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.SellerService;

@Controller
public class HomeController {
	@Autowired private MembersService memService;
	@Autowired private SellerService selService;
	
	@RequestMapping("/")
	public String home() {
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
		System.out.println("�α׾ƿ�����");
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginOk(String joinradio,String email, String pwd,HttpSession session,boolean idcheckBox,HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, String> map=new HashMap<String, String>();
		//System.out.println(idcheckBox);
		
		
		if(idcheckBox) {
			//��Ű�߰�
			Cookie idCook=new Cookie("mem_email", email); //��Ű����
			Cookie pwdCook=new Cookie("mem_pwd", pwd); //��Ű����
			Cookie chk=new Cookie("chk", "check");
			idCook.setMaxAge(60*60*24); //��Ű�Ⱓ 
			pwdCook.setMaxAge(60*60*24); //��Ű�Ⱓ �Ϸ�
			chk.setMaxAge(60*60*24); //��Ű�Ⱓ �Ϸ�
			response.addCookie(chk);
			response.addCookie(idCook);
			response.addCookie(pwdCook);
			
		}else {
			//��� ��Ű����
			Cookie[] cookies=request.getCookies();
			if(cookies!=null) {
				for(int i=0;i<cookies.length;i++) {
					cookies[i].setMaxAge(0); //��ȿ�ð� 0
					response.addCookie(cookies[i]); //�������?
				}
			}
		}
		
		int n=0;
		int m=0;
		if(joinradio.equals("mem_email") ) {
			map.put("mem_email", email);
			map.put("mem_pwd",pwd);
			n=memService.logincheck(map);
			if(n>0) {
				session.setAttribute("email", email);
				
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
}
