package com.spring.join;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.login.LoginVo;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private JoinDao joinDao;
	
	@Override
	public void insertJoin(LoginVo vo) {

		joinDao.insertJoin(vo);

	}

	@Override
	public HashMap<String, Object> idDupCheck(HashMap<String, Object> map) {
		map = joinDao.idDupCheck(map);
		return map;
	}

}
