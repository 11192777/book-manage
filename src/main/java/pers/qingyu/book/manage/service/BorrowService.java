package pers.qingyu.book.manage.service;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.BorrowBean;
import pers.qingyu.book.manage.bean.PressBean;

public interface BorrowService {

	int queryBorrowCount(Map<String, Object> paramMap);

	List<PressBean> queryBorrowData(Map<String, Object> paramMap);

	void insertBorrowed(BorrowBean borrow);

	List<BorrowBean> pageQueryBuId(String userId);

	void deleteBorrow(BorrowBean bean);

	BorrowBean queryBookById(BorrowBean bean);

}
