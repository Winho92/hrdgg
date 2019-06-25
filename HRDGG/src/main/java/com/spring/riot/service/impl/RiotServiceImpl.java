package com.spring.riot.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.riot.dao.RiotDao;
import com.spring.riot.service.RiotService;
import com.spring.riot.vo.ChampionVo;

@Service
public class RiotServiceImpl implements RiotService{

	@Autowired
	private RiotDao riotDao;
	
	@Override
	public void insertChamp(HashMap<String, Object> map) {
		riotDao.insertChamp(map);
	}

	@Override
	public List<ChampionVo> selectChampList(HashMap<String, Object> map) {
		return riotDao.selectChampList(map);
	}

	@Override
	public ChampionVo selectChampDetail(HashMap<String, Object> map) {
		return riotDao.selectChampDetail(map);
	}
	

}
