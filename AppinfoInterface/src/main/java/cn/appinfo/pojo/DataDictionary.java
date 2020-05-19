package cn.appinfo.pojo;

import lombok.Data;

import java.util.Date;

/**
 * 数据字典表
 *
 * @author Administrator
 */
@Data
public class DataDictionary {
    private Integer id;//主键id
    private String typeCode;//类型编码
    private String typeName;//类型名称
    private Integer valueId;//类型值ID
    private String valueName;//类型值name
    private Integer createdBy;//创建者
    private Date creationDate;//创建时间
    private Integer modifyBy;//更新者
    private Date modifyDate;//更新时间


}
