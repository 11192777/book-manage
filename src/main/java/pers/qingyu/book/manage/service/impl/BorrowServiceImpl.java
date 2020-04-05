package pers.qingyu.book.manage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.book.manage.bean.BorrowBean;
import pers.qingyu.book.manage.bean.PressBean;
import pers.qingyu.book.manage.dao.BorrowDao;
import pers.qingyu.book.manage.service.BorrowService;

@Service
public class BorrowServiceImpl implements BorrowService{

	@Autowired
	private BorrowDao borrowDao;
	
	@Override
	public int queryBorrowCount(Map<String, Object> paramMap) {
		return borrowDao.queryBorrowCount(paramMap);
	}

	@Override
	public List<PressBean> queryBorrowData(Map<String, Object> paramMap) {
		return borrowDao.queryBorrowData(paramMap);
	}

	@Override
	public void insertBorrowed(BorrowBean borrow) {
		borrowDao.insertBorrowed(borrow);
	}

	@Override
	public List<BorrowBean> pageQueryBuId(String userId) {
		return borrowDao.pageQueryBuId(userId);
	}

	@Override
	public void deleteBorrow(BorrowBean bean) {
		borrowDao.deleteBorrow(bean);
	}

	@Override
	public BorrowBean queryBookById(BorrowBean bean) {
		return borrowDao.queryBookById(bean);
	}


}
