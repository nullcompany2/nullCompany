package com.kh.nullcompany.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.reservation.model.dao.ReservationDao;
import com.kh.nullcompany.reservation.model.vo.Category;
import com.kh.nullcompany.reservation.model.vo.Reservation;
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

	@Override
	public int deleteResource(int rsNo) {
		return rDao.deleteResource(rsNo);
	}

	@Override
	public int updateResouce(Resource r) {
		return rDao.updateResouce(r);
	}

	@Override
	public Resource selectUpdateResource(int rsNo) {
		return rDao.selectResource(rsNo);
	}

	@Override
	public ArrayList<Reservation> selectReservationList(Map map) {
		return rDao.selectReservationList(map);
	}

	@Override
	public int insertReservation(Reservation r) {
		return rDao.insertReservation(r);
	}

	@Override
	public ArrayList<Reservation> selectMyreservationList(String rMember) {
		return rDao.selectMyreservationList(rMember);
	}

}
