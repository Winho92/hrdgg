package com.spring.ajax.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.join.JoinService;

@RestController
public class AjaxController {
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value="/IdDupCheck", method=RequestMethod.GET,
			headers="Accept=application/json")
	public HashMap<String, Object> idDupCheck(@RequestParam HashMap<String, Object> map) {
		
		map = joinService.idDupCheck(map);
		
		return map;
	}
}
