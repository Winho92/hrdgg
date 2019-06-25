package com.spring.login;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public LoginVo login(HashMap<String, Object> map) {
		LoginVo loginVo = sqlSession.selectOne("Login.Login", map);

		return loginVo;
	}

}
