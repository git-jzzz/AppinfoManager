package cn.appinfo.service.appcategory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.appcategory.AppCategoryMapper;
import cn.appinfo.pojo.AppCategory;

import javax.annotation.Resource;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {
	
	@Resource
	private AppCategoryMapper appCategoryMapper;
	
	

	public void setAppCategoryMapper(AppCategoryMapper appCategoryMapper) {
		this.appCategoryMapper = appCategoryMapper;
	}



	@Override
	public List<AppCategory> getCategoryListByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		return appCategoryMapper.getCategoryListByParentId(parentId);
	}

}
