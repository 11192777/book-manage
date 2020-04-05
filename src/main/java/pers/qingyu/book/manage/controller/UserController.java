package pers.qingyu.book.manage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.book.manage.ajax.bean.AjaxResult;
import pers.qingyu.book.manage.ajax.bean.Datas;
import pers.qingyu.book.manage.ajax.bean.PageBean;
import pers.qingyu.book.manage.bean.UserBean;
import pers.qingyu.book.manage.service.UserService;
import pers.qingyu.book.manage.util.MD5Util;
import pers.qingyu.book.manage.util.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;


	@RequestMapping("/add")
	public String addUser() {
		return "user/add";
	}
	
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deleteUsers (Datas users) {
		AjaxResult result = new AjaxResult();
		try {
			int count = userService.deleteUsers(users);
			result.setSuccess(count == users.getIds().size());
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Object deleteUser (String userId) {
		AjaxResult result = new AjaxResult();
		try {
			userService.deleteUserById(userId);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("/edit")
	public String edit(String userId, Model model) {
		UserBean user = userService.queryUserById(userId);
		model.addAttribute("user", user);
		return "user/edit";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Object updateUser (UserBean user) {
		AjaxResult result = new AjaxResult();
		
		try {
			userService.updateUser(user);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("insert")
	public Object insert (UserBean user) {
		AjaxResult result = new AjaxResult();
		
		try {
			user.setUserPassword(MD5Util.digest(user.getUserPassword()));
			userService.insertUser(user);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/login")
	public Object login(UserBean user, HttpSession session) {

		AjaxResult result = new AjaxResult();

		user.setUserPassword(MD5Util.digest(user.getUserPassword()));
		UserBean dbUser = userService.queryLoginUser(user);

		if (dbUser != null) {
			session.setAttribute("loginUser", dbUser);
			result.setData(dbUser.getManageBook() == user.getManageBook() ? user.getManageBook() : "-1");
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}

		return result;
	}

	@RequestMapping("/userManage")
	public String userMange() {
		return "user/userManage";
	}

	@ResponseBody
	@RequestMapping("/userManage/pageQuery")
	public Object pageQuery(Integer pageNo, Integer pageSize, String queryText) {
		AjaxResult result = new AjaxResult();

		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int userCount = userService.queryUserCount(paramMap);

			PageBean<UserBean> userPage = new PageBean<>();
			userPage.setDatas(userService.queryPageData(paramMap));
			userPage.setTotalSize(userCount);
			userPage.setTotalNo(userCount % pageSize == 0 ? userCount / pageSize : (userCount / pageSize) + 1);
			userPage.setPageNo(pageNo);
			userPage.setPageSize(pageSize);

			result.setData(userPage);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

}
