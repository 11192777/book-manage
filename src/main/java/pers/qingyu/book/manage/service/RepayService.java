package pers.qingyu.book.manage.service;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.PressBean;

public interface RepayService {
	
	int queryRepayCount(Map<String, Object> paramMap);

	List<PressBean> queryRepayData(Map<String, Object> paramMap);

}
