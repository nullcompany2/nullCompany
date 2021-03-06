package com.kh.nullcompany.notice.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Repository("nDao")
public class noticeDao {

	@Autowired
	private SqlSession sqlSession;


	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<notice> selectListNotice(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectListNotice",null,rowBounds);
	}

	public int updateCount(int nNo) {
		return sqlSession.update("noticeMapper.updateCount",nNo);
	}

	public notice selectNotice(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice",nNo);
	}

	public ArrayList<ncomment> selectnCommentList(int nNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectnCommentList",nNo);
	}
	public int insertnComment(ncomment c) {
		return sqlSession.insert("noticeMapper.insertnComment",c);
	}

	public int insertNotice(notice n) {
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	





	public int ndelete(int nNo) {
		return sqlSession.update("noticeMapper.ndelete",nNo);
	}

	public int nupdate(notice n) {
		return sqlSession.update("noticeMapper.nupdate", n);
	}

	public ArrayList<notice> noticeList() {
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeList");
	}

	public int updateNotice(notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(int nNo) {
		return sqlSession.update("noticeMapper.deleteNotice",nNo);
	}

	public ArrayList<notice> searchnTitle(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchnTitle",map);
	}

	public ArrayList<notice> searchnWriter(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchnWriter",map);
	}

	public ArrayList<notice> searchnContent(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchnContent",map);
	}

	public ArrayList<notice> searchntitleContent(Map map) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchntitleContent",map);
	}
}


