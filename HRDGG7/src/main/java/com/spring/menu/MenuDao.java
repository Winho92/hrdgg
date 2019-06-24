package com.spring.menu;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuDao")
public class MenuDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<MenuVo> getList() {
		HashMap<String, Object> map = new HashMap<>();
		sqlSession.selectList("Menu.List", map);
		List<MenuVo> list = (List<MenuVo>) map.get("result");
		return list;
	}

	public MenuVo getCont(MenuVo menuVo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("menu_id", menuVo.getMenu_id());
		sqlSession.selectOne("Menu.Get", map);
		MenuVo menu = ((List<MenuVo>)map.get("result")).get(0);
		return menu;
	}

	public void insertMenu(MenuVo menuVo) {
		sqlSession.insert("Menu.Add", menuVo);
	}

	public void deleteMenu(MenuVo menuVo) {
		sqlSession.delete("Menu.Remove", menuVo);
	}
	
	public void updateMenu(MenuVo menuVo) {
		sqlSession.update("Menu.Update", menuVo);
	}

}
