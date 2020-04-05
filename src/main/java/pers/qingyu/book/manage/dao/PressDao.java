package pers.qingyu.book.manage.dao;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.PressBean;

public interface PressDao {

	int queryPressCount(Map<String, Object> paramMap);

	List<PressBean> queryPressData(Map<String, Object> paramMap);
	
	PressBean quertPress (String pressId);
	
}