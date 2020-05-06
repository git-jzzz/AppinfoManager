package cn.appinfo.mapper.backenduser;

import cn.appinfo.pojo.BackendUser;

public interface BackendUserMapper {
	
	
	/**
	 * 后台登录验证
	 * @param backendUser
	 * @return
	 */
	BackendUser bulogin(BackendUser backendUser);
}
