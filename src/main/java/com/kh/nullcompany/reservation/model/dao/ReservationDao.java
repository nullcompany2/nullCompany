package com.kh.nullcompany.reservation.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.reservation.model.vo.Category;
import com.kh.nullcompany.reservation.model.vo.Reservation;
import com.kh.nullcompany.reservation.model.vo.Resource;

@Repository("rDao")
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCategory(Category c) {
		return sqlSession.insert("reservationMapper.insertCategory",c);
	}

	public ArrayList<Category> selectCategoryList() {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectCategory");
	}

	public Category selectCategoty(int rcNo) {
		return sqlSession.selectOne("reservationMapper.selectUpdateCategory",rcNo);
		
	}

	public int updateCategory(Category c) {
		System.out.println(c);
		return sqlSession.update("reservationMapper.UpdateCategory",c);
	}

	public int deleteCategory(int rcNo) {
		return sqlSession.update("reservationMapper.DeleteCategory",rcNo);
	}

	public ArrayList<Resource> selectResourceList() {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList");
	}

	public int insertResource(Resource r) {
		return sqlSession.insert("reservationMapper.insertResource",r);
	}

	public ArrayList<Resource> selectResourceList(int rcNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList2",rcNo);
	}

	public int deleteResource(int rsNo) {
		return sqlSession.update("reservationMapper.DeleteResouce",rsNo);
	}

	public int updateResouce(Resource r) {
		return sqlSession.update("reservationMapper.UpdateResouce",r);
	}

	public Resource selectResource(int rsNo) {
		return sqlSession.selectOne("reservationMapper.selectResource",rsNo);
	}

	public ArrayList<Reservation> selectReservationList(Map map) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList",map);
	}

	public int insertReservation(Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation",r);
	}

	public ArrayList<Reservation> selectMyreservationList(String rMember) {
		return(ArrayList)sqlSession.selectList("reservationMapper.selectMyreservationList",rMember);
	}

	public int reservationReturn(int rNo) {
		return sqlSession.update("reservationMapper.reservationReturn",rNo);
	}

	public ArrayList<Reservation> selectReservationList() {
		return (ArrayList)sqlSession.selectList("reservationMapper.ReservationList");
	}

	public int reservationDelete(int rNo) {
		return sqlSession.delete("reservationMapper.reservationDelete",rNo);
	}

	public int getListCount() {
		return sqlSession.selectOne("reservationMapper.getListCount");
	}

	public ArrayList<Reservation> selectReservationList2(PageInfo pi,int rcNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reservationMapper.ReservationList",rcNo,rowBounds);
	}

	public int getListCount(int rcNo) {
		return sqlSession.selectOne("reservationMapper.getListCount2",rcNo);
	}
	
}
