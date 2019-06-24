package com.spring.riot.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.riot.dao.RiotDao;
import com.spring.riot.vo.ChampionVo;

@Repository
public class RiotDaoImpl implements RiotDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertChamp(HashMap<String, Object> map) {
		sqlSession.insert("Riot.InsertChamp", map);
	}

	@Override
	public List<ChampionVo> selectChampList(HashMap<String, Object> map) {
		sqlSession.selectList("Riot.SelectAllChamp", map);
		return (List<ChampionVo>) map.get("result");
	}

	@Override
	public ChampionVo selectChampDetail(HashMap<String, Object> map) {
		sqlSession.selectList("Riot.SelectChamp", map);
		List<ChampionVo> list = (List<ChampionVo>) map.get("result");
		return list.get(0);
	}

}
