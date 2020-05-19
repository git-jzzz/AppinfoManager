package cn.appinfo.service.datadictionary;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appinfo.pojo.DataDictionary;

public interface DataDictionaryService {
    /**
     * 依据typeCode获取字典表列表
     *
     * @param typeCode
     * @return
     */
    List<DataDictionary> getDataDictionaryList(@Param("typeCode") String typeCode);

}
