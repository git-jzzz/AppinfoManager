package cn.appinfo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class AppCategory {
    private Integer id;//主键id
    private String categoryCode;//分类编码
    private String categoryName;//分类名称
    private Integer parentId;//父级节点id
    private Integer createdBy;//创建者
    private Date creationDate;//创建时间
    private Integer modifyBy;//更新者
    private Date modifyDate;//更新时间

}
