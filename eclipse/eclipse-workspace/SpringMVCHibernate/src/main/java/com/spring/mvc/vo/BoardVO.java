package com.spring.mvc.vo;

import java.io.Serializable;
import java.util.Date;

public class BoardVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int m_boardseq;
	private String m_userid;
	private String m_usernik;
	private String m_title;
	private String m_content;
	private int m_count;
	private Date m_date;
	private String m_delchk;
	
	public int getM_boardseq() {
		return m_boardseq;
	}
	public void setM_boardseq(int m_boardseq) {
		this.m_boardseq = m_boardseq;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public int getM_count() {
		return m_count;
	}
	public void setM_count(int m_count) {
		this.m_count = m_count;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_usernik() {
		return m_usernik;
	}
	public void setM_usernik(String m_usernik) {
		this.m_usernik = m_usernik;
	}
	public String getM_delchk() {
		return m_delchk;
	}
	public void setM_delchk(String m_delchk) {
		this.m_delchk = m_delchk;
	}
	
	@Override
	public String toString() {
		return "BoardVO [m_boardseq=" + m_boardseq + ", m_userid=" + m_userid + ", m_usernik=" + m_usernik
				+ ", m_title=" + m_title + ", m_content=" + m_content + ", m_count=" + m_count + ", m_date=" + m_date
				+ ", m_delchk=" + m_delchk + "]";
	}
	
}

