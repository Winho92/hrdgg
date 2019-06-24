package com.spring.login;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;

	@Override
	public LoginVo login(HashMap<String, Object> map) {
		return loginDao.login(map);
	}

}
