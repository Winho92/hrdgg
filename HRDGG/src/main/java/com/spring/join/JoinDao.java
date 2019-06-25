package com.spring.join;

import java.util.HashMap;

import com.spring.login.LoginVo;

public interface JoinDao {

	public void insertJoin(LoginVo vo);

	public HashMap<String, Object> idDupCheck(HashMap<String, Object> map);

}
