package cn.appinfo.controller;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.appinfo.util.Result;
import cn.appinfo.util.TableData;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.appinfo.pojo.AppCategory;
import cn.appinfo.pojo.AppInfo;
import cn.appinfo.pojo.BackendUser;
import cn.appinfo.pojo.DataDictionary;
import cn.appinfo.pojo.DevUser;
import cn.appinfo.service.appcategory.AppCategoryService;
import cn.appinfo.service.appinfo.AppInfoService;
import cn.appinfo.service.appversion.AppVersionService;
import cn.appinfo.service.datadictionary.DataDictionaryService;
import org.springframework.web.multipart.MultipartFile;

/**
 * app信息控制层
 *
 * @author Administrator
 */
@RequestMapping(value = "/sys")
@Controller
public class AppInfoController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private AppVersionService appVersionService;

    @Autowired
    private AppCategoryService appCategoryService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private HttpServletRequest request;


    @RequestMapping(value = "/dev_auth", method = RequestMethod.GET)
    @ResponseBody
    public Result dev_auth() {
        return Result.ok();
    }

    private String reload() {
        return request.getAttribute("reloadToken") != null ? request.getAttribute("reloadToken").toString() : null;
    }


    /*applist*/
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public TableData getAppInfoByCondition(@RequestParam(name = "softwareName",required = false) String softwareName, @RequestParam(name = "status",required = false) String status, @RequestParam(required = false) String flatformId, @RequestParam(required = false) String categoryLevel1, @RequestParam(required = false) String categoryLevel2,
                                           @RequestParam(required = false) String categoryLevel3, HttpServletRequest request, @RequestParam(defaultValue = "1") String page, @RequestParam(required = false, defaultValue = "5") String limit, HttpServletResponse response) {

        AppInfo appinfo = new AppInfo();
        appinfo.setSoftwareName(softwareName);
        appinfo.setStatus(status == null || status.equals("") ? null : Integer.parseInt(status));
        appinfo.setFlatformId(flatformId == null || flatformId.equals("") ? null : Integer.parseInt(flatformId));
        appinfo.setCategoryLevel1(categoryLevel1 == null || categoryLevel1.equals("") ? null : Integer.parseInt(categoryLevel1));
        appinfo.setCategoryLevel2(categoryLevel2 == null || categoryLevel2.equals("") ? null : Integer.parseInt(categoryLevel2));
        appinfo.setCategoryLevel3(categoryLevel3 == null || categoryLevel3.equals("") ? null : Integer.parseInt(categoryLevel3));
//        appinfo.setDevId(((DevUser)request.getSession().getAttribute("du"))==null?((BackendUser)request.getSession().getAttribute("bu")).getId():((DevUser)request.getSession().getAttribute("du")).getId());
        appinfo.setDevId(1);
        //获取条件
        TableData<AppInfo> data = new TableData<AppInfo>();
        data.setCount(appInfoService.count(appinfo));

        data.setData(appInfoService.getAppInfoByCondition(appinfo, (Integer.parseInt(page) - 1) * Integer.parseInt(limit), Integer.parseInt(limit)));

        data.setCode(0);
        if (reload() != null) {
            response.addHeader("reloadToken", reload());
        }
        return data;
    }
    /**
     * 查询分类列表
     *
     * @return
     */
    @RequestMapping(value = "/categoryList", method = RequestMethod.GET)
    @ResponseBody
    public Result getCategoryListByParentId(String parentId) {
        Integer pid = parentId == null || parentId.equals("0") ? 0 : Integer.parseInt(parentId);
        List<AppCategory> clist = appCategoryService.getCategoryListByParentId(pid);
        return reload()==null? Result.ok(clist):Result.ok(clist, reload());
    }


    /**
     * 依据typeCode获取 数据字典表列表
     *
     * @return
     */
    @RequestMapping(value = "/datedictionlist", method = RequestMethod.GET)
    @ResponseBody
    public Result getDateDictionaryList(String typeCode) {
        List<DataDictionary> dlist = dataDictionaryService.getDataDictionaryList(typeCode);
        return reload()==null? Result.ok(dlist):Result.ok(dlist, reload());
    }


    /**
     * 保存logo图片
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "/logoimg")
    @ResponseBody
    public Result logoimg(MultipartFile file, HttpServletRequest request) {
        String src1 = null;
        String src2 = null;
        try {
            if (file != null) {
                String path = "D:\\File\\tomcatFile\\Appinfo\\img";
                String oldFileName = file.getOriginalFilename();//获取原文件名
                String pix = oldFileName.substring(oldFileName.lastIndexOf("."));
                String fileName = UUID.randomUUID().toString() + pix;//随机后的名字
                File files = new File(path, fileName);
                if (!files.exists()) {
                    files.mkdirs();//不存在则创建
                }
                file.transferTo(files);
                src2 = fileName;
                src1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/upload/img/" + fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Object> map2 = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map2.put("src1", src1);//URL地址
        map2.put("src2", src2);//tomcat上传地址
        map.put("data", map2);
        return reload()==null? Result.ok(map):Result.ok(map,reload());
    }


    /**
     * 重名验证
     *
     * @param aPKName
     * @return
     */
    @RequestMapping(value = "/findbyapkname")
    @ResponseBody
    public Result findByAPKName(String aPKName) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", appInfoService.findByAPKName(aPKName) > 0 ? "exits" : "noexits");
        return reload()==null? Result.ok(map):Result.ok(map,reload());
    }

    /**
     * 新增app保存
     *
     * @return
     */
    @RequestMapping(value = "/appaddsave")
    @ResponseBody
    public Result appadd(AppInfo appinfo, HttpServletRequest request) {
        /*  appinfo.setDevId(((DevUser)request.getSession().getAttribute("du")).getId());*/
        appinfo.setDevId(1);
        appinfo.setCreationDate(new Date());
        int result = appInfoService.addAppinfo(appinfo);
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", result > 0 ? "success" : "lose");
        return reload()==null? Result.ok(map):Result.ok(map, reload());

    }


    /**
     * 依据ID查询APP详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findbyid", method = RequestMethod.GET)
    @ResponseBody
    public Result findById(String id, String versionId) {
        AppInfo appinfo = appInfoService.findById(Integer.parseInt(id));
        Map<String, Object> map = new HashMap<>();
        map.put("appinfo", appinfo);
        if (versionId != null) {
            map.put("version", appVersionService.getVersionByid(Integer.parseInt(versionId)));
        }
        return reload()==null? Result.ok(map):Result.ok(map, reload());
    }


    /**
     * 修改qpp基础信息保存
     *
     * @return
     */
    @RequestMapping(value = "/appupdatesave")
    @ResponseBody
    public Result appupdate(AppInfo appinfo, HttpServletRequest request) {
        appinfo.setModifyBy(1);
//id        appinfo.setModifyBy((((DevUser)request.getSession().getAttribute("du")).getId()));
        appinfo.setModifyDate(new Date());
        int result = appInfoService.updateAppinfo(appinfo);
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", result > 0 ? "success" : "lose");
        return reload()==null? Result.ok(map):Result.ok(map, reload());
    }


    /**
     * 删除app信息
     *
     * @param appId
     * @return
     */
    @RequestMapping(value = "/deleteAppinfo")
    @ResponseBody
    public Result deleteAppinfo(String appId) {
        Map<String, String> map = new HashMap<String, String>();
        if (appVersionService.selectCount(Integer.parseInt(appId)) > 0) {
            appVersionService.deleteVersion(Integer.parseInt(appId));
        }
        map.put("result", appInfoService.deleteAppinfo(Integer.parseInt(appId)) > 0 ? "success" : "lose");
        return reload()==null? Result.ok(map):Result.ok(map, reload());
    }

    /**
     * 修改app状态操作
     *
     * @param id
     * @param status
     * @return
     */
    @RequestMapping(value = "/setStatus")
    @ResponseBody
    public Result setStatus(String id, String status) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", appInfoService.setStatus(Integer.parseInt(id), Integer.parseInt(status)) > 0 ? "success" : "lose");
        return reload()==null? Result.ok(map):Result.ok(map, reload());
    }

    /**
     * 删除图片文件
     *
     * @return
     */
    @RequestMapping(value = "/delImg")
    @ResponseBody
    public Result delImg(String id, String fileName, HttpServletRequest request) {

        Map<String, String> map = new HashMap<String, String>();
        String path = "D:\\File\\tomcatFile\\Appinfo\\img";
        File file = new File(path, fileName);
        if (file.exists()) {
            file.delete();//删除文件
            map.put("result", appInfoService.delImg(Integer.parseInt(id)) > 0 ? "success" : "lose");
        } else {
            map.put("result", "lose2");
        }
        return reload()==null? Result.ok(map):Result.ok(map, reload());
    }
}
