package cn.appinfo.controller;

import cn.appinfo.pojo.AppCategory;
import cn.appinfo.pojo.AppInfo;
import cn.appinfo.pojo.DataDictionary;
import cn.appinfo.service.appcategory.AppCategoryService;
import cn.appinfo.service.appinfo.AppInfoService;
import cn.appinfo.service.appversion.AppVersionService;
import cn.appinfo.service.datadictionary.DataDictionaryService;
import cn.appinfo.util.IgnoreSecurity;
import cn.appinfo.util.Result;
import cn.appinfo.util.TableData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/sys/back")
@Controller

public class AppinfoBackController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private AppVersionService appVersionService;

    @Autowired
    private AppCategoryService appCategoryService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @RequestMapping(value = "/back_auth", method = RequestMethod.GET)
    @ResponseBody
    public Result back_auth() {
        return Result.ok();
    }


    private String reload() {
        return request.getAttribute("reloadToken") != null ? request.getAttribute("reloadToken").toString() : null;
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

    @Autowired
    private HttpServletRequest request;

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

        return reload()==null? Result.ok(clist):Result.ok(clist,reload());
    }

    /*applist*/
    @RequestMapping(value = "/list")
    @ResponseBody
    public TableData getAppInfoByCondition(@RequestParam(required = false) String softwareName, @RequestParam(required = false) String status, @RequestParam(required = false) String flatformId, @RequestParam(required = false) String categoryLevel1, @RequestParam(required = false) String categoryLevel2,
                                           @RequestParam(required = false) String categoryLevel3, HttpServletResponse response,  @RequestParam(defaultValue = "1") String page, @RequestParam(required = false, defaultValue = "5") String limit) {
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


}
