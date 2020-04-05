package pers.qingyu.book.manage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.bean.UserInformationBean;
import pers.qingyu.book.manage.dao.UserInformationDao;
import pers.qingyu.book.manage.service.UserInformationService;

@Service
public class UserInformationServiceImpl implements UserInformationService{
	
	@Autowired
	private UserInformationDao userInformationDao;

	@Override
	public int queryUserCount(Map<String, Object> paramMap) {
		return userInformationDao.queryUserCount(paramMap);
	}

	@Override
	public List<UserInformationBean> queryPageData(Map<String, Object> paramMap) {
		return userInformationDao.queryPageData(paramMap);
	}
	
}
