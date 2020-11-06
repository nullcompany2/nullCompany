package com.kh.nullcompany.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.reservation.model.dao.ReservationDao;
import com.kh.nullcompany.reservation.model.vo.Category;
import com.kh.nullcompany.reservation.model.vo.Resource;

@Service("rService")
public class ReservationServiceImpl implements ReservationService  {
	
	@Autowired
	private ReservationDao rDao;
	
	@Override
	public int insertCategory(Category c) {
		return rDao.insertCategory(c);
	}

	@Override
	public ArrayList<Category> selectCategoryList() {
		return rDao.selectCategoryList();
	}

	@Override
	public Category selectUpdateCategory(int rcNo) {
		return rDao.selectCategoty(rcNo);
	}

	@Override
	public int updateCategory(Category c) {
		return rDao.updateCategory(c);
	}

	@Override
	public int deleteCategory(int rcNo) {
		return rDao.deleteCategory(rcNo);
	}

	@Override
	public ArrayList<Resource> selectResourceList() {
		return rDao.selectResourceList();
	}

	@Override
	public int insertResource(Resource r) {
		return rDao.insertResource(r);
	}

	@Override
	public ArrayList<Resource> selectResourceList(int rcNo) {
		return rDao.selectResourceList(rcNo);
	}

}