package pers.qingyu.book.manage.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.book.manage.ajax.bean.AjaxResult;
import pers.qingyu.book.manage.ajax.bean.PageBean;
import pers.qingyu.book.manage.bean.BookBean;
import pers.qingyu.book.manage.bean.BorrowBean;
import pers.qingyu.book.manage.service.BookService;
import pers.qingyu.book.manage.service.BorrowService;
import pers.qingyu.book.manage.service.RepayService;
import pers.qingyu.book.manage.util.StringUtil;

@Controller
@RequestMapping("reader")
public class ReaderController {

	@Autowired
	private BookService bookService;
	@Autowired
	private BorrowService borrowService;

	@RequestMapping("lookBooks")
	public String lookBooks() {
		return "reader/lookBooks";
	}

	@RequestMapping("returnBook")
	public String returnBook() {
		return "reader/returnBook";
	}

	@RequestMapping("borrowed")
	public String borrowed() {
		return "reader/borrowed";
	}
	
	@ResponseBody
	@RequestMapping("borrowed/pageQuery")
	public Object borrowedPageQuery(String userId) {
		AjaxResult result = new AjaxResult();
		try {
			List<BorrowBean> page = borrowService.pageQueryBuId(userId);
			result.setData(page);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping("borrowed/borrowBook")
	public Object borrowBook(String userId, String bookId) {
		AjaxResult result = new AjaxResult();
		
		BorrowBean bean = new BorrowBean();
		bean.setBookId(bookId);
		bean.setUserId(userId);

		try {
			BookBean book = bookService.queryBookById(bookId);
			BorrowBean borrowed = borrowService.queryBookById(bean);
			if (book != null) {
				if (book.getBookRepertory() <= 0 || borrowed != null) {
					result.setSuccess(false);
					return result;
				}
				book.setBookRepertory(book.getBookRepertory() - 1);
				bookService.updateBook(book);
				BorrowBean borrow = new BorrowBean();
				java.util.Date date = new java.util.Date();
				borrow.setBookId(bookId).setUserId(userId).setBorrowDate(new Date(date.getTime()));
				borrowService.insertBorrowed(borrow);
			}
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("/book/pageQuery")
	public Object pageQuery(Integer pageNo, Integer pageSize, String queryText) {
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
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("ajaxReturnBook")
	public Object ajaxReturnBook1(String userId, String bookId) {
		
		AjaxResult result = new AjaxResult();
		try {
			BookBean returnBook = bookService.queryBookById(bookId);
			returnBook.setBookCategory(returnBook.getBookCategory() + 1);
			bookService.updateBook(returnBook);
			
			BorrowBean bean = new BorrowBean();
			bean.setBookId(bookId);
			bean.setUserId(userId);
			borrowService.deleteBorrow(bean);
			
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
}

