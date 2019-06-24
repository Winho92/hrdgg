package com.spring.menu;

public class MenuVo {
	private String menu_id;
	private String menu_name;
	private int    menu_seq;
	public MenuVo() {
	
	}
	public MenuVo(String menu_id, String menu_name, int menu_seq) {
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_seq = menu_seq;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	@Override
	public String toString() {
		return "MenuVo [menu_id=" + menu_id + ", menu_name=" + menu_name + ", menu_seq=" + menu_seq + "]";
	}
	
}
