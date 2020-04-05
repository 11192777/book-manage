package pers.qingyu.book.manage.dao;

import java.util.List;
import java.util.Map;


import pers.qingyu.book.manage.bean.BookBean;

public interface BookDao {

	int queryBookCount(Map<String, Object> paramMap);

	List<BookBean> queryPageData(Map<String, Object> paramMap);

	BookBean queryBookById(String bookId);

	void updateBook(BookBean book);
	
	BookBean queryBookAndPress (String bookId);
}
