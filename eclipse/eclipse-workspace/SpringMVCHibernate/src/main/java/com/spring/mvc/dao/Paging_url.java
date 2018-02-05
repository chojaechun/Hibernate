package com.spring.mvc.dao;

public class Paging_url {
	private int startCount;
	private int endCount;
	private StringBuffer pagingHtml;

	public Paging_url(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl) {
		this(null, null, currentPage, totalCount, blockCount, blockPage,
				pageUrl, null);
	}

	public Paging_url(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl, String addKey) {
		this(null, null, currentPage, totalCount, blockCount, blockPage,
				pageUrl, addKey);
	}

	public Paging_url(String keyField, String keyWord, int currentPage,
			int totalCount, int blockCount, int blockPage, String pageUrl) {
		this(keyField, keyWord, currentPage, totalCount, blockCount, blockPage,
				pageUrl, null);
	}

	public Paging_url(String keyField, String keyWord, int currentPage,
			int totalCount, int blockCount, int blockPage, String pageUrl,
			String addKey) {
		if (addKey == null) {
			addKey = "";
		}
		int totalPage = (int)Math.ceil((double)totalCount/blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		this.startCount = ((currentPage - 1) * blockCount + 1);
		this.endCount = (currentPage * blockCount);

		int startPage = (currentPage - 1) / blockPage * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		this.pagingHtml = new StringBuffer();		

		if (currentPage > blockPage) {
			if (keyWord == null) {
				this.pagingHtml.append("<li><a href=" + pageUrl + "?pageNum="
						+ (startPage - 1) + addKey + ">");
			} else {
				this.pagingHtml.append("<li><a href=" + pageUrl + "?keyField="
						+ keyField + "&keyWord=" + keyWord + "&pageNum="
						+ (startPage - 1) + addKey + "#thirdContainer"+" style='text-decoration: none;'>");
			}
			this.pagingHtml.append("<font size='2'>Prev</font>");
			this.pagingHtml.append("</a></li>");
		}
		
		//this.pagingHtml.append("&nbsp;&nbsp;");
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				this.pagingHtml.append("<li><a href='#thirdContainer'><b> <font color='red'>");
				this.pagingHtml.append(i);
				this.pagingHtml.append("</font></b></a></li>");
			} else {
				if (keyWord == null) {
					this.pagingHtml.append("<li><a href='" + pageUrl
							+ "?pageNum=");
				} else {
					this.pagingHtml.append("<li><a href='" + pageUrl
							+ "?keyField=" + keyField + "&keyWord=" + keyWord
							+ "&pageNum=");
				}
				this.pagingHtml.append(i);
				this.pagingHtml.append(addKey + "#thirdContainer'style='text-decoration: none;'>");
				this.pagingHtml.append(i);
				this.pagingHtml.append("</a></li>");
			}
			//this.pagingHtml.append("&nbsp;");
		}
		//this.pagingHtml.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (totalPage - startPage >= blockPage) {
			if (keyWord == null) {
				this.pagingHtml.append("<li><a href=" + pageUrl + "?pageNum="
						+ (endPage + 1) + addKey + ">");
			} else {
				this.pagingHtml.append("<li><a href=" + pageUrl + "?keyField="
						+ keyField + "&keyWord=" + keyWord + "&pageNum="
						+ (endPage + 1) + addKey +"#thirdContainer"+" style='text-decoration: none;'>");
			}
			this.pagingHtml.append("<font size='2'>Next</font>");
			this.pagingHtml.append("</a></li>");
		}
		
	}

	public StringBuffer getPagingHtml() {
		return this.pagingHtml;
	}

	public int getStartCount() {
		return this.startCount;
	}

	public int getEndCount() {
		return this.endCount;
	}
}
