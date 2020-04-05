package pers.qingyu.book.manage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.bean.BookBean;
import pers.qingyu.book.manage.dao.BookDao;
import pers.qingyu.book.manage.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;


	@Override
	public int queryBookCount(Map<String, Object> paramMap) {
		return bookDao.queryBookCount(paramMap);
	}

	@Override
	public List<BookBean> queryPageData(Map<String, Object> paramMap) {
		return bookDao.queryPageData(paramMap);
	}

	@Override
	public BookBean queryBookById(String bookId) {
		return bookDao.queryBookById(bookId);
	}

	@Override
	public void updateBook(BookBean book) {
		bookDao.updateBook(book);
	}

}
