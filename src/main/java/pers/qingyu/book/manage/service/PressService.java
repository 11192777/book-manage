package pers.qingyu.book.manage.service;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.PressBean;

public interface PressService {

	int queryPressCount(Map<String, Object> paramMap);

	List<PressBean> queryPressData(Map<String, Object> paramMap);

}
