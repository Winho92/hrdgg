package com.spring.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("menuService")
public class MenuService {
	
	@Autowired
	private MenuDao menuDao;

	public List<MenuVo> getList() {
		
		return menuDao.getList();
	}
	
	public MenuVo getCont(MenuVo menuVo) {
		return menuDao.getCont(menuVo);		
	}

	public void insertMenu(MenuVo menuVo) {
		menuDao.insertMenu(menuVo);
	}

	public void updateMenu(MenuVo menuVo) {
		menuDao.updateMenu(menuVo);
	}

	public void deleteMenu(MenuVo menuVo) {
		menuDao.deleteMenu(menuVo);
	}
}
