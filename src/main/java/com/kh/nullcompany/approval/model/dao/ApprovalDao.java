package com.kh.nullcompany.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Step;
import com.kh.nullcompany.board.model.vo.PageInfo;

@Repository("aDao")
public class ApprovalDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getProgressAllListCount(int memNo) {
		return sqlSession.selectOne("approvalMapper.getProgressAllListCount", memNo);
	}

	public ArrayList<Document> selectProgressAllList(int memNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectProgressAllList",memNo, rowBounds);
	}

	public ArrayList<Step> selectStepList(String docTempNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectStepList",docTempNo);
	}

	public int getCompleteAllListCount(int memNo) {
		return sqlSession.selectOne("approvalMapper.getCompleteAllListCount", memNo);
	}

	public ArrayList<Document> selectCompleteAllList(int memNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectCompleteAllList",memNo, rowBounds);
	}

}
