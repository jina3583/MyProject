package oracle.java.oMybatis.model;

import java.util.Date;

public class TBoard {
	private int tnum;
	private String ttitle;
	private String tcontent;
	private String tadmin;
	private Date tdate;
	private int thit;
	
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public String getTadmin() {
		return tadmin;
	}
	public void setTadmin(String tadmin) {
		this.tadmin = tadmin;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public int getThit() {
		return thit;
	}
	public void setThit(int thit) {
		this.thit = thit;
	}
	
}
