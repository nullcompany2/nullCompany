package com.kh.nullcompany.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.reservation.model.vo.Category;
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
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList");
	}
	
}
