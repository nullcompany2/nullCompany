package com.kh.nullcompany.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Leave;
import com.kh.nullcompany.approval.model.vo.Resign;
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

	public Document approvalDetail(String docNo) {
		return sqlSession.selectOne("approvalMapper.approvalDetail",docNo);
	}

	public Leave selectLeaveInfo(String docTempNo) {
		return sqlSession.selectOne("approvalMapper.selectLeaveInfo",docTempNo);
	}

	public Absence selectAbsenceInfo(String docTempNo) {
		return sqlSession.selectOne("approvalMapper.selectAbsenceInfo",docTempNo);
	}

	public Resign selectResignInfo(String docTempNo) {
		return sqlSession.selectOne("approvalMapper.selectResignInfo",docTempNo);
	}

	public int stepSigning(String docTempNo, int memNo) {
		
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("memNo",memNo);
		
		return sqlSession.update("approvalMapper.stepSigning",map);
	}

	public int documentSigning(String docTempNo, int stepPriority) {
		
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("stepPriority",stepPriority);
		
		return sqlSession.update("approvalMapper.documentSigning",map);
	}

	public int decisionSigning(String docTempNo, int stepPriority) {
		
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("stepPriority",stepPriority);
		
		return sqlSession.update("approvalMapper.decisionSigning",map);
	}

	public int stepRejecting(String docTempNo, int memNo) {
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("memNo",memNo);
		
		return sqlSession.update("approvalMapper.stepRejecting",map);
	}

	public int decisionRejecting(String docTempNo, int stepListCount) {
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("stepListCount",stepListCount);
		
		return sqlSession.update("approvalMapper.decisionRejecting",map);
	}

	public int stepReference(String docTempNo, int memNo) {
		Map map = new HashMap();
		
		map.put("docTempNo", docTempNo);
		map.put("memNo",memNo);
		
		return sqlSession.update("approvalMapper.stepReference",map);
	}

}
