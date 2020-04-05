package pers.qingyu.book.manage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.bean.PressBean;
import pers.qingyu.book.manage.dao.RepayDao;
import pers.qingyu.book.manage.service.RepayService;

@Service
public class OverdueServiceImpl implements RepayService {
	
	@Autowired
	private RepayDao overdueDao;
	
	@Override
	public int queryRepayCount(Map<String, Object> paramMap) {
		return overdueDao.queryRepayCount(paramMap);
	}

	@Override
	public List<PressBean> queryRepayData(Map<String, Object> paramMap) {
		return overdueDao.queryRepayData(paramMap);
	}

}
