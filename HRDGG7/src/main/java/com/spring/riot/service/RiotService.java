package com.spring.riot.service;

import java.util.HashMap;
import java.util.List;

import com.spring.riot.vo.ChampionVo;

public interface RiotService {

	public void insertChamp(HashMap<String, Object> map);

	public List<ChampionVo> selectChampList(HashMap<String, Object> map);

	public ChampionVo selectChampDetail(HashMap<String, Object> map);

}
