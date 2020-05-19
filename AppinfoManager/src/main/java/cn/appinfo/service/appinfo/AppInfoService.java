package cn.appinfo.service.appinfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appinfo.pojo.AppInfo;

public interface AppInfoService {
	/**
	 * 软件名  app状态  所属平台   一二三级分类
	 * 依据条件查询开发者下的app信息列表
	 * @param appinfo
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	List<AppInfo> getAppInfoByCondition(AppInfo appinfo, @Param("startRow") int startRow, @Param("pageSize") int pageSize);
	
	/**
	 * 查询条件下的app信息条数
	 * @param appinfo
	 * @return
	 */
	int count(AppInfo appinfo);
	
	/**
	 * 重名验证APKName
	 * @param APKName
	 * @return
	 */
	int findByAPKName(@Param("APKName") String APKName);
	
	/**
	 * 新增app信息
	 * @param appinfo
	 * @return
	 */
	int addAppinfo(AppInfo appinfo);
	
	/**
	 * 依据id查询appinfo详情
	 * @param id
	 * @return
	 */
	AppInfo findById(@Param("id") int id);
	
	
	/**
	 * 修改app基础信息
	 * @param appinfo
	 * @return
	 */
	int updateAppinfo(AppInfo appinfo);
	/**
	 * 修改最新版本号
	 * @param appinfo
	 * @return
	 */
	int updateAppversion(AppInfo appinfo);
	
	/**
	 * 依据id删除app信息
	 * @param id
	 * @return
	 */
	int deleteAppinfo(@Param("id") int id);
	
	/**
	 * 修改app状态
	 * @param id
	 * @param status
	 * @return
	 */
	int setStatus(@Param("id") int id, @Param("status") int status);
	
	/**
	 * 依据id移除img文件
	 * @param id
	 * @return
	 */
	int delImg(@Param("id") int id);
}

