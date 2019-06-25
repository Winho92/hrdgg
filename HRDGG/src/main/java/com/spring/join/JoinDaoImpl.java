package com.spring.join;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.login.LoginVo;

@Repository("joinDao")
public class JoinDaoImpl implements JoinDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertJoin(LoginVo vo) {

		sqlSession.insert("Join.InsertJoin", vo	);

	}

	@Override
	public HashMap<String, Object> idDupCheck(HashMap<String, Object> map) {
		LoginVo loginVo = sqlSession.selectOne("Join.IdDupCheck", map);
		map.put("loginVo", loginVo);
		return map;
	}

}
