package cn.appinfo.util;

import java.util.List;

import cn.appinfo.pojo.AppInfo;
import lombok.Data;

@Data
public class Page<T> {
	private int pageSize=50;
	private int pageNo;
	private int count;
	private	int pageCount;
	private	List<T> list;
	public void setCount(int count) {
		if(count>0){
			this.count = count;
			this.pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		}
	}

	

}
