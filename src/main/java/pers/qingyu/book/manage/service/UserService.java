package pers.qingyu.book.manage.service;


import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.ajax.bean.Datas;
import pers.qingyu.book.manage.bean.UserBean;

public interface UserService{
	
	UserBean queryLoginUser(UserBean user);

	List<UserBean> queryPageData(Map<String, Object> paramMap);

	int queryUserCount(Map<String, Object> paramMap);

	void insertUser(UserBean user);

	UserBean queryUserById(String userId);

	void updateUser(UserBean user);

	void deleteUserById(String userId);

	int deleteUsers(Datas users);

}
