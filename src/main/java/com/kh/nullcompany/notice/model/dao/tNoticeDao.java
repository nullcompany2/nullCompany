package com.kh.nullcompany.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.vo.tcomment;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Repository("tDao")
public class tNoticeDao {

	@Autowired
	private SqlSession sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.gettListCount");
	}

	public ArrayList<tnotice> selectListtNotice(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectListtNotice",null,rowBounds);
	}

	public int updateCount(int tNo) {
		return sqlSession.update("noticeMapper.updatetCount",tNo);
	}

	public tnotice selecttNotice(int tNo) {
		return sqlSession.selectOne("noticeMapper.selecttNotice",tNo);
	}

	public ArrayList<tcomment> selecttCommentList(int tNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selecttCommentList",tNo);
	}

	public int inserttComment(tcomment c) {
		return sqlSession.insert("noticeMapper.inserttComment",c);
	}




}