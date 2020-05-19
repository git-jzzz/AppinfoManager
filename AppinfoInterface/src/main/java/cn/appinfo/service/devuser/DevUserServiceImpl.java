package cn.appinfo.service.devuser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.devuser.DevUserMapper;
import cn.appinfo.pojo.DevUser;

import javax.annotation.Resource;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {

    @Resource
    private DevUserMapper devUserMapper;


    public void setDevUserMapper(DevUserMapper devUserMapper) {
        this.devUserMapper = devUserMapper;
    }


    @Override
    public DevUser login(DevUser du) {
        // TODO Auto-generated method stub
        return devUserMapper.login(du);
    }

}
