package cn.appinfo.service.appinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.appinfo.AppInfoMapper;
import cn.appinfo.pojo.AppInfo;

import javax.annotation.Resource;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {
	
	@Resource
	private AppInfoMapper appInfoMapper;

	public void setAppInfoMapper(AppInfoMapper appInfoMapper) {
		this.appInfoMapper = appInfoMapper;
	}

	@Override
	public List<AppInfo> getAppInfoByCondition(AppInfo appinfo, int startRow,
			int pageSize) {
		// TODO Auto-generated method stub
		return appInfoMapper.getAppInfoByCondition(appinfo, startRow, pageSize);
	}

	@Override
	public int count(AppInfo appinfo) {
		// TODO Auto-generated method stub
		return appInfoMapper.count(appinfo);
	}

	@Override
	public int findByAPKName(String APKName) {
		// TODO Auto-generated method stub
		return appInfoMapper.findByAPKName(APKName);
	}

	@Override
	public int addAppinfo(AppInfo appinfo) {
		// TODO Auto-generated method stub
		return appInfoMapper.addAppinfo(appinfo);
	}

	@Override
	public AppInfo findById(int id) {
		// TODO Auto-generated method stub
		return appInfoMapper.findById(id);
	}

	@Override
	public int updateAppinfo(AppInfo appinfo) {
		// TODO Auto-generated method stub
		return appInfoMapper.updateAppinfo(appinfo);
	}

	@Override
	public int updateAppversion(AppInfo appinfo) {
		// TODO Auto-generated method stub
		return appInfoMapper.updateAppversion(appinfo);
	}

	@Override
	public int deleteAppinfo(int id) {
		// TODO Auto-generated method stub
		return appInfoMapper.deleteAppinfo(id);
	}

	@Override
	public int setStatus(int id, int status) {
		// TODO Auto-generated method stub
		return appInfoMapper.setStatus(id, status);
	}

	@Override
	public int delImg(int id) {
		// TODO Auto-generated method stub
		return appInfoMapper.delImg(id);
	}
	
	
}
