package pers.qingyu.book.manage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.book.manage.ajax.bean.AjaxResult;
import pers.qingyu.book.manage.ajax.bean.PageBean;
import pers.qingyu.book.manage.bean.PressBean;
import pers.qingyu.book.manage.service.PressService;
import pers.qingyu.book.manage.util.StringUtil;

@Controller
@RequestMapping("/press")
public class PressController {

	@Autowired
	private PressService pressService;
	
	@RequestMapping("/pressManage")
	public String pressManage() {
		return "press/pressManage";
	}
	
	@ResponseBody
	@RequestMapping("/pressManage/pageQuery")
	public Object pageQuery(Integer pageNo, Integer pageSize , String queryText) {
		AjaxResult result = new AjaxResult();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int pressCount = pressService.queryPressCount(paramMap);
			
			PageBean<PressBean> pressPage = new PageBean<>();
			pressPage.setDatas(pressService.queryPressData(paramMap));
			pressPage.setTotalSize(pressCount);
			pressPage.setTotalNo(pressCount % pageSize == 0 ? pressCount / pageSize : (pressCount / pageSize) + 1);
			pressPage.setPageNo(pageNo);
			pressPage.setPageSize(pageSize);
			
			result.setData(pressPage);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
}
