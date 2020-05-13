package cn.appinfo.mapper.appversion;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appinfo.pojo.AppVersion;

public interface AppVersionMapper {
	/**
	 * 依据appid查询集合
	 * @param appId
	 * @return
	 */
	List<AppVersion> getVlist(@Param("appId") Integer appId);
	
	/**
	 * 新增app版本信息
	 * @param appVersion
	 * @return
	 */
	int addVersion(AppVersion appVersion);
	
	/**
	 * 查询该软件下最新版本id
	 * @param appId
	 * @return
	 */
	int findMaxVersionid(@Param("appId") Integer appId);
	
	/**
	 * 依据版本id返回版本信息
	 * @param id
	 * @return
	 */
	AppVersion getVersionByid(@Param("id") Integer id);
	
	/**
	 * 修改版本信息
	 * @param appVersion
	 * @return
	 */
	int updateVersion(AppVersion appVersion);
	
	/**
	 * 查询应用下版本数
	 * @param appId
	 * @return
	 */
	int selectCount(@Param("appId") int appId);
	
	/**
	 * 删除app下所有版本信息
	 * @param appId
	 * @return
	 */
	int deleteVersion(@Param("appId") int appId);
	
	/**
	 * 删除apk路径存储
	 * @param id
	 * @return
	 */
	int delVersionsrc(@Param("id") int id);
	
	
}
