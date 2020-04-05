package pers.qingyu.book.manage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.book.manage.ajax.bean.AjaxResult;
import pers.qingyu.book.manage.ajax.bean.PageBean;
import pers.qingyu.book.manage.bean.UserInformationBean;
import pers.qingyu.book.manage.service.UserInformationService;
import pers.qingyu.book.manage.util.StringUtil;


@Controller
@RequestMapping("/information")
public class UserIofomationController {

	@Autowired
	private UserInformationService userInformationService;
	
	
	@RequestMapping("/userDescribe")
	public String userDescribe () {
		return "user/userDescribe";
	}
	
	@ResponseBody
	@RequestMapping("/userDescribe/pageQuery")
	public Object pageQuery(Integer pageNo, Integer pageSize , String queryText) {
		AjaxResult result = new AjaxResult();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int userCount = userInformationService.queryUserCount(paramMap);
			
			PageBean<UserInformationBean> userPage = new PageBean<>();
			userPage.setDatas(userInformationService.queryPageData(paramMap));
			userPage.setTotalSize(userCount);
			userPage.setTotalNo(userCount % pageSize == 0 ? userCount / pageSize : (userCount / pageSize) + 1);
			userPage.setPageNo(pageNo);
			userPage.setPageSize(pageSize);
			
			result.setData(userPage);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
}
