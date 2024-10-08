package com.ps.tp.vo;

import java.util.Date;

public class PageVO {

	private int bno;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bView;
	private int bChu;
	public int getBno() {
		return bno;
	}
	public String getbTitle() {
		return bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public int getbView() {
		return bView;
	}
	public int getbChu() {
		return bChu;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public void setbView(int bView) {
		this.bView = bView;
	}
	public void setbChu(int bChu) {
		this.bChu = bChu;
	}
	
	

}
