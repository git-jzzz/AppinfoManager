package cn.appinfo.service.backenduser;

import cn.appinfo.pojo.BackendUser;

public interface BackendUserService {
	/**
	 * 后台登录验证
	 * @param backendUser
	 * @return
	 */
	BackendUser bulogin(BackendUser backendUser);

}
