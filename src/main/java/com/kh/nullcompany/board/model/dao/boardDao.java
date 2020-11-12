package com.kh.nullcompany.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.bcomment;

@Repository("bDao")
public class boardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");


	}

	public ArrayList<board> selectListBoard(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoard",null,rowBounds);
	}

	public int updateCount(int bNo) {
		return sqlSession.update("boardMapper.updateCount",bNo);
	}

	public board selectNotice(int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",bNo);
	}

	public ArrayList<bcomment> selectbCommentList(int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectbCommentList",bNo);
	}

	public int insertbComment(bcomment c) {
		return sqlSession.insert("boardMapper.insertbComment",c);
	}
}