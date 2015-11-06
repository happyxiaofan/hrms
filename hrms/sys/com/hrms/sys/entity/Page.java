package com.hrms.sys.entity;

public class Page {
	private int pagesize;// ÿҳ��ʾ��������¼
	private int pagenum;// ҳ��
	private int pagecount;// һ���ж���ҳ
	private int recordcount;// һ���ж�������¼

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getRecordcount() {
		return recordcount;
	}

	public void setRecordcount(int recordcount) {
		this.recordcount = recordcount;
	}

}
