package cn.appinfo.util;

import java.util.List;

import cn.appinfo.pojo.AppInfo;

public class Page {
	private int pageSize=50;
	private int pageNo;
	private int count;
	private	int pageCount;
	private	List<AppInfo> list;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		if(count>0){
			this.count = count;
			this.pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		}
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public List<AppInfo> getList() {
		return list;
	}
	public void setList(List<AppInfo> list) {
		this.list = list;
	}
	
	

}
