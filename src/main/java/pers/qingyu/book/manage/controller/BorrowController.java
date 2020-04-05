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
import pers.qingyu.book.manage.service.BorrowService;
import pers.qingyu.book.manage.service.RepayService;
import pers.qingyu.book.manage.util.StringUtil;

@Controller
@RequestMapping("/borrow")
public class BorrowController {

	@Autowired
	private BorrowService borrowService;
	
	@Autowired
	private RepayService repayService;
	
	
	@RequestMapping("/bookBorrow")
	public String bookBorrow () {
		return "borrow/bookBorrow";
	}
	
	@RequestMapping("/repay")
	public String overdue () {
		return "borrow/repay";
	}
	
	@ResponseBody
	@RequestMapping("/bookBorrow/pageQuery")
	public Object borrowPageQuery(Integer pageNo, Integer pageSize , String queryText) {
		AjaxResult result = new AjaxResult();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int borrowCount = borrowService.queryBorrowCount(paramMap);
			
			PageBean<PressBean> borrowPage = new PageBean<>();
			borrowPage.setDatas(borrowService.queryBorrowData(paramMap));
			borrowPage.setTotalSize(borrowCount);
			borrowPage.setTotalNo(borrowCount % pageSize == 0 ? borrowCount / pageSize : (borrowCount / pageSize) + 1);
			borrowPage.setPageNo(pageNo);
			borrowPage.setPageSize(pageSize);
			
			result.setData(borrowPage);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/repay/pageQuery")
	public Object repayPageQuery(Integer pageNo, Integer pageSize , String queryText) {
		AjaxResult result = new AjaxResult();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageNo - 1) * pageSize);
			paramMap.put("size", pageSize);
			paramMap.put("queryText", StringUtil.fuzzyQueryStringDeal(queryText));

			int repayCount = repayService.queryRepayCount(paramMap);
			
			PageBean<PressBean> repayPage = new PageBean<>();
			repayPage.setDatas(repayService.queryRepayData(paramMap));
			repayPage.setTotalSize(repayCount);
			repayPage.setTotalNo(repayCount % pageSize == 0 ? repayCount / pageSize : (repayCount / pageSize) + 1);
			repayPage.setPageNo(pageNo);
			repayPage.setPageSize(pageSize);
			
			result.setData(repayPage);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
}
