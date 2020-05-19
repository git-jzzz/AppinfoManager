package cn.appinfo.service.appversion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.appversion.AppVersionMapper;
import cn.appinfo.pojo.AppVersion;

import javax.annotation.Resource;

@Service("appVersionService")
public class AppVersionServiceImpl implements AppVersionService {

    @Resource
    private AppVersionMapper appVersionMapper;


    public void setAppVersionMapper(AppVersionMapper appVersionMapper) {
        this.appVersionMapper = appVersionMapper;
    }


    @Override
    public List<AppVersion> getVlist(Integer appId) {
        // TODO Auto-generated method stub
        return appVersionMapper.getVlist(appId);
    }


    @Override
    public int addVersion(AppVersion appVersion) {
        // TODO Auto-generated method stub
        return appVersionMapper.addVersion(appVersion);
    }


    @Override
    public int findMaxVersionid(Integer appId) {
        // TODO Auto-generated method stub
        return appVersionMapper.findMaxVersionid(appId);
    }


    @Override
    public AppVersion getVersionByid(Integer id) {
        // TODO Auto-generated method stub
        return appVersionMapper.getVersionByid(id);
    }


    @Override
    public int updateVersion(AppVersion appVersion) {
        // TODO Auto-generated method stub
        return appVersionMapper.updateVersion(appVersion);
    }


    @Override
    public int deleteVersion(int appId) {
        // TODO Auto-generated method stub
        return appVersionMapper.deleteVersion(appId);
    }


    @Override
    public int selectCount(int appId) {
        // TODO Auto-generated method stub
        return appVersionMapper.selectCount(appId);
    }


    @Override
    public int delVersionsrc(int id) {
        // TODO Auto-generated method stub
        return appVersionMapper.delVersionsrc(id);
    }

}
