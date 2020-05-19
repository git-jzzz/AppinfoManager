package cn.appinfo.mapper.appcategory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appinfo.pojo.AppCategory;

/**
 * app分类表
 * @author Administrator
 *
 */
public interface AppCategoryMapper {
	
	/**
	 * 依据父id查询分类列表
	 * @param parentId
	 * @return
	 */
	List<AppCategory> getCategoryListByParentId(@Param("parentId") Integer parentId);
}
