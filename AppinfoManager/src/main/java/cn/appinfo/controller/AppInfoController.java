package cn.appinfo.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import cn.appinfo.util.TableData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;

import cn.appinfo.pojo.AppCategory;
import cn.appinfo.pojo.AppInfo;
import cn.appinfo.pojo.BackendUser;
import cn.appinfo.pojo.DataDictionary;
import cn.appinfo.pojo.DevUser;
import cn.appinfo.service.appcategory.AppCategoryService;
import cn.appinfo.service.appinfo.AppInfoService;
import cn.appinfo.service.appversion.AppVersionService;
import cn.appinfo.service.datadictionary.DataDictionaryService;

/**
 * app信息控制层
 * @author Administrator
 *
 */
@RequestMapping(value="/sys")
@Controller
public class AppInfoController {
	
	@Autowired
	private  AppInfoService appInfoService;
	
	@Autowired
	private AppVersionService appVersionService;
	
	@Autowired
	private AppCategoryService appCategoryService;
	
	@Autowired
	private DataDictionaryService  dataDictionaryService;
	


	public void setAppVersionService(AppVersionService appVersionService) {
		this.appVersionService = appVersionService;
	}

	public void setDataDictionaryService(DataDictionaryService dataDictionaryService) {
		this.dataDictionaryService = dataDictionaryService;
	}

	public void setAppCategoryService(AppCategoryService appCategoryService) {
		this.appCategoryService = appCategoryService;
	}

	public void setAppInfoService(AppInfoService appInfoService) {
		this.appInfoService = appInfoService;
	}
	
	@RequestMapping(value="/tolist.html")
	public String tolist(String i){
		if(i!=null){
			return "checklist";
		}
		return "list";
		
	}
	
	/**
	 * 返回app信息列表
	 * @param softwareName
	 * @param status
	 * @param flatformId
	 * @param categoryLevel1
	 * @param categoryLevel2
	 * @param categoryLevel3
	 * @param request
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value="/list.html")
	@ResponseBody
	public Object getAppInfoByCondition(@RequestParam(required=false)String softwareName,@RequestParam(required=false)String status,@RequestParam(required=false)String flatformId,@RequestParam(required=false)String categoryLevel1,@RequestParam(required=false)String categoryLevel2,
			@RequestParam(required=false)String categoryLevel3,HttpServletRequest request,@RequestParam(defaultValue="1")String page,@RequestParam(required=false)String limit){
			AppInfo appinfo=new AppInfo();
				appinfo.setSoftwareName(softwareName);
				appinfo.setStatus(status==null||status.equals("")?null: Integer.parseInt(status));
				appinfo.setFlatformId(flatformId==null||flatformId.equals("")?null: Integer.parseInt(flatformId));
				appinfo.setCategoryLevel1(categoryLevel1==null||categoryLevel1.equals("")?null: Integer.parseInt(categoryLevel1));
				appinfo.setCategoryLevel2(categoryLevel2==null||categoryLevel2.equals("")?null: Integer.parseInt(categoryLevel2));
				appinfo.setCategoryLevel3(categoryLevel3==null||categoryLevel3.equals("")?null: Integer.parseInt(categoryLevel3));
				appinfo.setDevId(((DevUser)request.getSession().getAttribute("du"))==null?((BackendUser)request.getSession().getAttribute("bu")).getId():((DevUser)request.getSession().getAttribute("du")).getId());
			//获取条件
			TableData<AppInfo> data=new TableData<AppInfo>();
			data.setCount(appInfoService.count(appinfo));
			
			data.setData(appInfoService.getAppInfoByCondition(appinfo, (Integer.parseInt(page)-1)*Integer.parseInt(limit),Integer.parseInt(limit)));
			
			data.setCode(0);
			return JSONArray.toJSONString(data);
	}
	
	/**
	 * 查询分类列表
	 * @return
	 */
	@RequestMapping(value="/categoryList.html")
	@ResponseBody
	public Object getCategoryListByParentId(String parentId){
		Integer pid=parentId==null||parentId.equals("0")?0:Integer.parseInt(parentId);
		List<AppCategory> clist=appCategoryService.getCategoryListByParentId(pid);
		return JSONArray.toJSONString(clist);
	}
	
	/**
	 *依据typeCode获取 数据字典表列表
	 * @return
	 */
	@RequestMapping(value="/datedictionlist.html")
	@ResponseBody
	public Object getDateDictionaryList(String typeCode){
		 List<DataDictionary> dlist=dataDictionaryService.getDataDictionaryList(typeCode);
		/* TableData<DataDictionary> data=new TableData<DataDictionary>();
		 data.setCode(0);
		 data.setData(dlist);*/
		return 	JSONArray.toJSONString(dlist);
	}
	
	
	
	
	@RequestMapping(value="/totest.html")
	public String totest(){
		return "test";
	}

	@RequestMapping(value="/toappadd.html")
	public String toadd(){
		return "appadd";
	}
	
	/**
	 * 保存logo图片
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/logoimg.html")
	@ResponseBody
	public Object logoimg(MultipartFile file,HttpServletRequest request){
		String src1=null;
		String src2=null;
		try {
			if(file!=null){
				String path="D:\\File\\tomcatFile\\Appinfo";
				String oldFileName=file.getOriginalFilename();//获取原文件名
				String pix=oldFileName.substring(oldFileName.lastIndexOf("."));
				String fileName=UUID.randomUUID().toString()+pix;//随机后的名字
				File files=new File(path,fileName);
				if(!files.exists()){
					files.mkdirs();//不存在则创建
				}
				file.transferTo(files);
					src2=fileName;
				 src1 = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + "/appinfosystem/upload/"+ fileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		Map<String,Object> map2=new HashMap<String,Object>();
	    Map<String,Object> map=new HashMap<String,Object>();
	    map.put("code",0);
	    map.put("msg","");
	    map2.put("src1",src1);//URL地址
	    map2.put("src2",src2);//tomcat上传地址
	    map.put("data",map2);
	  
		return JSONArray.toJSONString(map);
	}
	/**
	 * apkname重名验证
	 * @param APKName
	 * @return
	 */
	@RequestMapping(value="/findbyapkname.html")
	@ResponseBody
	public Object findByAPKName(String aPKName){
		Map<String, String> map=new HashMap<String, String>();
		map.put("result", appInfoService.findByAPKName(aPKName)>0?"exits":"noexits");
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 新增保存
	 * @return
	 */
	@RequestMapping(value="/appaddsave.html")
	@ResponseBody
	public Object appadd(AppInfo appinfo,HttpServletRequest request){
		appinfo.setDevId(((DevUser)request.getSession().getAttribute("du")).getId());
		appinfo.setCreationDate(new Date());
		int result=appInfoService.addAppinfo(appinfo);
		Map<String, String> map=new HashMap<String,String>();
		map.put("result",result>0?"success":"lose");
		return JSONArray.toJSONString(map);
		
	}
	
	/**
	 * 依据ID查询APP详情
	 * @param id
	 * @param request
	 * @param i
	 * @return
	 */
	@RequestMapping(value="/findbyid.html")
	public String findById(String id,Model model,String i,String versionId){
		AppInfo appinfo=appInfoService.findById(Integer.parseInt(id));
		model.addAttribute("appinfo", appinfo);
		if(i!=null){
			return "appupdate";
		}
		if(versionId!=null){
			model.addAttribute("version",appVersionService.getVersionByid(Integer.parseInt(versionId)) );
			return "appcheck";
		}
		return "appdesc";
	}
	
	/**
	 * 修改qpp基础信息保存
	 * @return
	 */
	@RequestMapping(value="/appupdatesave.html")
	@ResponseBody
	public Object appupdate(AppInfo appinfo,HttpServletRequest request){
		appinfo.setModifyBy((((DevUser)request.getSession().getAttribute("du")).getId()));
		appinfo.setModifyDate(new Date());
		int result=appInfoService.updateAppinfo(appinfo);
		Map<String, String> map=new HashMap<String,String>();
		map.put("result",result>0?"success":"lose");
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 删除app信息
	 * @param appId
	 * @return
	 */
	@RequestMapping(value="/deleteAppinfo.html")
	@ResponseBody
	public Object deleteAppinfo(String appId){
		Map<String, String> map=new HashMap<String,String>();
		if(appVersionService.selectCount(Integer.parseInt(appId))>0){
			appVersionService.deleteVersion(Integer.parseInt(appId));
		}
		map.put("result", appInfoService.deleteAppinfo(Integer.parseInt(appId))>0?"success":"lose");
		return  JSONArray.toJSONString(map);
	}
	
	/**
	 * 修改app状态操作
	 * @param id
	 * @param status
	 * @return
	 */
	@RequestMapping(value="/setStatus.html")
	@ResponseBody
	public Object setStatus(String id,String status){
		Map<String, String> map=new HashMap<String,String>();
		map.put("result",appInfoService.setStatus(Integer.parseInt(id),Integer.parseInt(status))>0?"success":"lose");
		return  JSONArray.toJSONString(map);
	}
	
	/**
	 * 删除图片文件
	 * @return
	 */
	@RequestMapping(value="/delImg.html")
	@ResponseBody
	public Object delImg(String id,String fileName,HttpServletRequest request){
		
		Map<String, String> map=new HashMap<String, String>();
		fileName=fileName.substring(fileName.indexOf("staticsimg")+10);
		String path="D:\\File\\tomcatFile\\Appinfo";
		File file=new File(path,fileName);
		if(file.exists()){
			file.delete();//删除文件
			map.put("result", appInfoService.delImg(Integer.parseInt(id))>0?"success":"lose");
		}else{
			map.put("result", "lose2");
		}
		return JSONArray.toJSONString(map);
	}
	
	
	
	
}	
