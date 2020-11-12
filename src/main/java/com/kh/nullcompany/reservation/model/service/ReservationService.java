package com.kh.nullcompany.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.reservation.model.vo.Category;
import com.kh.nullcompany.reservation.model.vo.Reservation;
import com.kh.nullcompany.reservation.model.vo.Resource;

public interface ReservationService {

	public int insertCategory(Category c);

	public ArrayList<Category> selectCategoryList();

	Category selectUpdateCategory(int rcNo);

	public int updateCategory(Category c);

	public int deleteCategory(int rcNo);

	public ArrayList<Resource> selectResourceList(int rcNo);

	public int insertResource(Resource r);

	ArrayList<Resource> selectResourceList();

	public int deleteResource(int rsNo);

	public int updateResouce(Resource r);

	public Resource selectUpdateResource(int rsNo);

	public ArrayList<Reservation> selectReservationList(Map map);

}
