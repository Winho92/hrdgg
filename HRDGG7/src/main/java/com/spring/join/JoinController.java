package com.spring.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.login.LoginVo;


@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@RequestMapping("/Join")
	   public String join() {
		
		   return "user/join";
	   }
	
	@RequestMapping("/Join/insertForm")
	public ModelAndView insertForm(LoginVo vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insert");

		mv.addObject("LoginVo", vo); 

		return mv;
	}
	
	@RequestMapping("/Join/insert")
	public ModelAndView insert(LoginVo vo) {
		
		joinService.insertJoin(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");

		
		return mv;
	}
}
