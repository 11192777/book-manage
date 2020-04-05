package pers.qingyu.book.manage.service;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.BookBean;

public interface BookService {
	
	int queryBookCount(Map<String, Object> paramMap);

	List<BookBean> queryPageData(Map<String, Object> paramMap);

	BookBean queryBookById(String bookId);

	void updateBook(BookBean book);

}
