package com.spring.reply;

public class ReplyVo {
	// Fields
	private int idx;
	private String cont;
	private String writer;
	private String regdate;
	private int rnum;
	private int lvl;
	private int step;
	private int nref;
	private int delnum;
	
	// Constructor
	public ReplyVo () {
		
	}
	public ReplyVo(int idx, String cont, String writer, String regdate, int rnum, int lvl, int step, int nref,
			int delnum) {
		this.idx = idx;
		this.cont = cont;
		this.writer = writer;
		this.regdate = regdate;
		this.rnum = rnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.delnum = delnum;
	}
	
	// Getter/Setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getNref() {
		return nref;
	}
	public void setNref(int nref) {
		this.nref = nref;
	}
	public int getDelnum() {
		return delnum;
	}
	public void setDelnum(int delnum) {
		this.delnum = delnum;
	}
	
	// toString
	@Override
	public String toString() {
		return "ReplyVo [idx=" + idx + ", cont=" + cont + ", writer=" + writer + ", regdate=" + regdate + ", rnum="
				+ rnum + ", lvl=" + lvl + ", step=" + step + ", nref=" + nref + ", delnum=" + delnum + "]";
	}
	
	
	
	
	
	
}
