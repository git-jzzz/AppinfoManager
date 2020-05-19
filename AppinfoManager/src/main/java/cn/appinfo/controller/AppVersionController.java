package cn.appinfo.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import cn.appinfo.util.TableData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;

import cn.appinfo.pojo.AppInfo;
import cn.appinfo.pojo.AppVersion;
import cn.appinfo.pojo.DevUser;
import cn.appinfo.service.appinfo.AppInfoService;
import cn.appinfo.service.appversion.AppVersionService;


@RequestMapping(value="/sys")
@Controller
public class AppVersionController {
	@Autowired
	private AppVersionService appVersionService;
	
	@Autowired
	private  AppInfoService appInfoService;
	
	
 
	public void setAppInfoService(AppInfoService appInfoService) {
		this.appInfoService = appInfoService;
	}



	public void setAppVersionService(AppVersionService appVersionService) {
		this.appVersionService = appVersionService;
	}
	
	
	
	@RequestMapping(value="/toappversionadd.html")
	public String toversionadd(String appId,HttpServletRequest request){
		request.getSession().setAttribute("appId", appId);
		return "appversionadd";
	}
	
	/**
	 * 历史版本
	 * @param appId
	 * @return
	 */
	@RequestMapping(value="/appversionlist.html")
	@ResponseBody
	public Object appVersionList(String appId){
		TableData<AppVersion> data=new TableData<AppVersion>();
		data.setCode(0);
		data.setData(appVersionService.getVlist(appId==null?null:Integer.parseInt(appId)));
		return JSONArray.toJSONString(data);
	}
	
	/**
	 * apk文件上传
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/apkupload.html")
	@ResponseBody
	public Object apkupload(MultipartFile file,HttpServletRequest request){
		String src1=null;
		String src2=null;
		String apkFileName=null;
		try {
			if(file!=null){
				String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"apk");
				String oldFileName=file.getOriginalFilename();//获取原文件名
				String pix=oldFileName.substring(oldFileName.lastIndexOf("."));
				String fileName=UUID.randomUUID().toString()+pix;//随机后的名字
				apkFileName=fileName;
				File files=new File(path,fileName);
				if(!files.exists()){
					files.mkdirs();//不存在则创建
				}
				file.transferTo(files);
					src2=File.separator+"statics"+File.separator+"apk"+File.separator+fileName;
				 src1 = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + "/AppInfoSys/statics/apk/"+ fileName;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		Map<String,Object> map2=new HashMap<String,Object>();
	    Map<String,Object> map=new HashMap<String,Object>();
	    map.put("code",0);
	    map.put("msg","");
	    map2.put("src1",src1);//URL地址
	    map2.put("src2",src2);//tomcat上传地址
	    map2.put("src3", apkFileName);//文件名
	    map.put("data",map2);
	  
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 新增版本 		 修改app信息版本号
	 * @param appVersion
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/versionadd.html")
	@ResponseBody
	public Object appVersionAdd(AppVersion appVersion,HttpServletRequest request){
			appVersion.setCreatedBy(((DevUser)request.getSession().getAttribute("du")).getId());
			appVersion.setCreationDate(new Date());
			Map<String, String> map=new HashMap<String, String>();
			
			if(appVersion.getId()!=null){
				//修改版本
				appVersion.setModifyBy(((DevUser)request.getSession().getAttribute("du")).getId());
				appVersion.setModifyDate(new Date());
				map.put("result",appVersionService.updateVersion(appVersion)>0?"success":"lose");
			}else{
				//新增版本
				if( appVersionService.addVersion(appVersion)>0){
					AppInfo appinfo=new AppInfo();
					appinfo.setModifyBy(((DevUser)request.getSession().getAttribute("du")).getId());
					appinfo.setModifyDate(new Date());
					appinfo.setId(appVersion.getAppId());
					appinfo.setVersionId(appVersionService.findMaxVersionid(appVersion.getAppId()));
					map.put("result",appInfoService.updateAppversion(appinfo)>0?"success":"lose");
				}else{
					map.put("result", "lose");
				}
			}
			
		return JSONArray.toJSONString(map);
	}
	
	@RequestMapping(value="/toversionupdate.html")
	public String findAppVersionId(String id,String appId,Model model){
			model.addAttribute("update", "is");
			model.addAttribute("appId", appId);
			model.addAttribute("version", appVersionService.getVersionByid(Integer.parseInt(id)));
		return "appversionadd";
	}
	
	/**
	 * 删除apk存储路径
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delversionsrc.html")
	@ResponseBody
	public Object delVersionSrc(String id,String apkFileName,HttpServletRequest request){
		Map<String,String> map=new HashMap<String,String>();
		String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"apk");
		File targetFile = new File(path, apkFileName);
		if (targetFile.exists()) {
			try {
				targetFile.delete();
				map.put("result", appVersionService.delVersionsrc(Integer.parseInt(id))>0?"success":"lose");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", "lose");
			}
		}else {
			map.put("result", "lose2");
		}
			return JSONArray.toJSONString(map);
	}	
	
	
	
}
