package com.spring.login;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/Login")
public class LoginController {
	
	@Autowired
	private LoginService loginServie;
	
	@RequestMapping("/")
	public String loginPage(@RequestParam HashMap<String, Object> map) {

		return "user/login";
	}

	@RequestMapping(value = "Login", method=RequestMethod.POST)
	public String login(RedirectAttributes rSession, HttpSession session, @RequestParam HashMap<String, Object> map) {
		// map.forEach((k,v) -> System.out.println("key : " + k + ", value : " + v));

		String returnURL = "";		
		
		LoginVo vo = loginServie.login(map);
		
		if(vo != null) {
			if (map.get("userpwd").equals(vo.getUserpwd())) {
				session.setAttribute("user", vo);
				returnURL = "redirect:/"; // 로그인 성공시 홈				
			} else {
				rSession.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
				returnURL = "redirect:/Login/";
			}
		} else {
			rSession.addFlashAttribute("msg", "해당하는 아이디가 없습니다.");
			returnURL = "redirect:/Login/";		
		}		
		return returnURL;
	}
	
	@RequestMapping("/Logout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
