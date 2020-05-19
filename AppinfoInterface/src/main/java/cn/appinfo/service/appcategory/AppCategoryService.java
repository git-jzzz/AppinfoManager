package cn.appinfo.service.appcategory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appinfo.pojo.AppCategory;

public interface AppCategoryService {

    /**
     * 依据父id查询分类列表
     *
     * @param parentId
     * @return
     */
    List<AppCategory> getCategoryListByParentId(@Param("parentId") Integer parentId);
}
