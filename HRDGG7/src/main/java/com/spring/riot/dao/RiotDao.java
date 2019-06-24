package com.spring.riot.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.riot.vo.ChampionVo;

public interface RiotDao {

	void insertChamp(HashMap<String, Object> map);

	List<ChampionVo> selectChampList(HashMap<String, Object> map);

	ChampionVo selectChampDetail(HashMap<String, Object> map);
	
}
