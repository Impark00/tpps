package com.ps.tp.vo;

import java.util.Date;

public class CommentVO {

	private int bno;
	private int rno;
	private String rContent;
	private Date rDate;

	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public String getrContent() {
		return rContent;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	
}
