package com.spring.mvc.dao;

import java.util.Date;

public class BoardVO {

	private int idx;
	private String userId;
	private String title;
	private String content;
	private int count;
	private Date date;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", userId=" + userId + ", title=" + title + ", content=" + content + ", count="
				+ count + ", date=" + date + "]";
	}
	

	
}

