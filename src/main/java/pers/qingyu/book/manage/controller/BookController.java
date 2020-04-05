package pers.qingyu.book.manage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.book.manage.ajax.bean.AjaxResult;
import pers.qingyu.book.manage.ajax.bean.PageBean;
import pers.qingyu.book.manage.bean.BookBean;
import pers.qingyu.book.manage.service.BookService;
import pers.qingyu.book.manage.util.StringUtil;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@RequestMapping("/bookManage")
	public String bookManage () {
		return "/book/bookManage";
	}
	
	@ResponseBody
	@RequestMapping("/bookManage/pageQuery")
	public Object pageQuery (Integer pageNo, Integer pageSize , String queryText) {
		AjaxResult result = new AjaxResult();
		
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int bookCount = bookService.queryBookCount(paramMap);
			
			PageBean<BookBean> bookPage = new PageBean<>();
			bookPage.setDatas(bookService.queryPageData(paramMap));
			bookPage.setTotalSize(bookCount);
			bookPage.setTotalNo(bookCount % pageSize == 0 ? bookCount / pageSize : (bookCount / pageSize) + 1);
			bookPage.setPageNo(pageNo);
			bookPage.setPageSize(pageSize);
			
			result.setData(bookPage);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
}
