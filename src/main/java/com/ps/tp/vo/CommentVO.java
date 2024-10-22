package com.ps.tp.vo;

import java.util.Date;

public class CommentVO {

	private int arno;
	private int ano;
	private String arwriter;
	private String arcontent;
	private Date ardate;
	
	public int getArno() {
		return arno;
	}
	public void setArno(int arno) {
		this.arno = arno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getArwriter() {
		return arwriter;
	}
	public void setArwriter(String arwriter) {
		this.arwriter = arwriter;
	}
	public String getArcontent() {
		return arcontent;
	}
	public void setArcontent(String arcontent) {
		this.arcontent = arcontent;
	}
	public Date getArdate() {
		return ardate;
	}
	public void setArdate(Date ardate) {
		this.ardate = ardate;
	}
}