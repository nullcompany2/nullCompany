package com.kh.nullcompany.notice.model.dao;

import java.util.ArrayList;
import java.util.Map;

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
	public int inserttNoice;

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

	public int inserttNoice(tnotice t) {
		return sqlSession.insert("noticeMapper.inserttNotice",t);
	}

	public ArrayList<tnotice> tnoticeList() {
		return (ArrayList)sqlSession.selectList("noticeMapper.tnoticeList");
	}

	public int updatetNotice(tnotice t) {
		return sqlSession.update("noticeMapper.updatetNotice", t);
	}

	public int deletetNotice(int tNo) {
		return sqlSession.update("noticeMapper.deletetNotice",tNo);
	}

	public ArrayList<tnotice> searchtTitle(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchtTitle",map);
	}

	public ArrayList<tnotice> searchtWriter(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchtWriter",map);
	}

	public ArrayList<tnotice> searchtContent(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchtContent",map);
	}

	public ArrayList<tnotice> searchttitleContent(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchttitleContent",map);
		
	}




}
