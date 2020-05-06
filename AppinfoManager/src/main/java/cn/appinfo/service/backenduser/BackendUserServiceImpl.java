package cn.appinfo.service.backenduser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.backenduser.BackendUserMapper;
import cn.appinfo.pojo.BackendUser;

import javax.annotation.Resource;

@Service("backendUserService")
public class BackendUserServiceImpl implements BackendUserService {
	
	@Resource
	private BackendUserMapper backendUserMapper;

	public void setBackendUserMapper(BackendUserMapper backendUserMapper) {
		this.backendUserMapper = backendUserMapper;
	}

	@Override
	public BackendUser bulogin(BackendUser backendUser) {
		// TODO Auto-generated method stub
		return backendUserMapper.bulogin(backendUser);
	}
	
	
}
