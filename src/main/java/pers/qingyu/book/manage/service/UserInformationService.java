package pers.qingyu.book.manage.service;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.UserInformationBean;

public interface UserInformationService {

	int queryUserCount(Map<String, Object> paramMap);

	List<UserInformationBean> queryPageData(Map<String, Object> paramMap);

}
