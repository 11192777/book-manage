package pers.qingyu.book.manage.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.ajax.bean.Datas;
import pers.qingyu.book.manage.bean.UserBean;
import pers.qingyu.book.manage.dao.UserDao;
import pers.qingyu.book.manage.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserBean queryLoginUser(UserBean user) {
		return userDao.queryLoginUser(user);
	}

	@Override
	public List<UserBean> queryPageData(Map<String, Object> paramMap) {
		return userDao.queryPageData(paramMap);
	}

	@Override
	public int queryUserCount(Map<String, Object> paramMap) {
		return userDao.queryUserCount(paramMap);
	}

	@Override
	public void insertUser(UserBean user) {
		userDao.insertUser(user);
	}

	@Override
	public UserBean queryUserById(String userId) {
		return userDao.queryUserById(userId);
	}

	@Override
	public void updateUser(UserBean user) {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUserById(String userId) {
		userDao.deleteUserById(userId);
	}

	@Override
	public int deleteUsers(Datas users) {
		return userDao.deleteUsers(users);
	}

}

