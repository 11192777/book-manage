package pers.qingyu.book.manage.dao;

import java.util.List;
import java.util.Map;

import pers.qingyu.book.manage.bean.BorrowBean;
import pers.qingyu.book.manage.bean.PressBean;

public interface BorrowDao {

	public int queryBorrowCount(Map<String, Object> paramMap);

	public List<PressBean> queryBorrowData(Map<String, Object> paramMap);

	public void insertBorrowed(BorrowBean borrow);

	public  List<BorrowBean> pageQueryBuId(String userId);

	public void deleteBorrow(BorrowBean bean);

	public BorrowBean queryBookById(BorrowBean bean);

}
