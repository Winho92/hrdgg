package com.spring.reply;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.BoardVo;

@Controller
@RequestMapping("/Reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/List")
	public ModelAndView list(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView("menu/comm/cont");
		
		List<ReplyVo> replyList= replyService.getList(map);	
		mv.addObject("replyList", replyList);
		mv.addObject("menu_id", map.get("menu_id"));
		
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(ReplyVo vo) {
		
		ModelAndView mv = new ModelAndView("menu/comm/cont");
		
		mv.addObject("replyVo", vo);
		mv.addObject("idx",vo.getIdx());
		
		return mv;
	}
	
	/*
	 * @RequestMapping("/Write") public ModelAndView write(ReplyVo replyVo) {
	 * ModelAndView mv = new ModelAndView("redirect:/Board/Cont");
	 * System.out.println("aaaaa:" +replyVo);
	 * 
	 * replyService.write(replyVo); mv.addObject("idx", replyVo.getIdx()); return
	 * mv; }
	 */
	
	@RequestMapping("/Write")
	public ModelAndView write(ReplyVo replyVo) {
		ModelAndView mv = new ModelAndView("redirect:/Board/Cont");
		System.out.println("replyVo:" + replyVo);

		replyService.write(replyVo);
		mv.addObject("idx", replyVo.getIdx());
		return mv;
	}
	
	@RequestMapping("/Remove")
	public ModelAndView remove(ReplyVo replyVo) {
		ModelAndView mv = new ModelAndView("redirect:/Board/Cont");
		System.out.println(replyVo);
		System.out.println("replyVo:" + replyVo);
		
		replyService.remove(replyVo);
		mv.addObject("idx", replyVo.getIdx());
		return mv;
	}
	
}
