package pers.qingyu.book.manage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.bean.PressBean;
import pers.qingyu.book.manage.dao.PressDao;
import pers.qingyu.book.manage.service.PressService;

@Service
public class PressServiceImpl implements PressService{

	@Autowired
	private PressDao pressDao;
	
	@Override
	public int queryPressCount(Map<String, Object> paramMap) {
		return pressDao.queryPressCount(paramMap);
	}

	@Override
	public List<PressBean> queryPressData(Map<String, Object> paramMap) {
		return pressDao.queryPressData(paramMap);
	}

}
