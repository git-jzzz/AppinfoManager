package cn.appinfo.util;

import java.util.ArrayList;
import java.util.List;

public class TableData<T> {
	private int code;
	private List<T> data=new ArrayList<T>();
	private int count;//数据库条数
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
