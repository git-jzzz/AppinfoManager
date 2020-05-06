package cn.appinfo.service.datadictionary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appinfo.mapper.datadictionary.DataDictionaryMapper;
import cn.appinfo.pojo.DataDictionary;

import javax.annotation.Resource;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {

	@Resource
	private DataDictionaryMapper dataDictionaryMapper;

	

	public void setDataDictionaryMapper(DataDictionaryMapper dataDictionaryMapper) {
		this.dataDictionaryMapper = dataDictionaryMapper;
	}

	@Override
	public List<DataDictionary> getDataDictionaryList(String typeCode) {
		// TODO Auto-generated method stub
		return dataDictionaryMapper.getDataDictionaryList(typeCode);
	}
	
	
	
	
	
}
