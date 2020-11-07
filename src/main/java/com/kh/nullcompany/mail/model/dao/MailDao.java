package com.kh.nullcompany.mail.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.model.vo.Member;

@Repository("maDao")
public class MailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 받은 메일함 리스트 갯수 카운트 
	public int getListCount(int memNo) {
		return sqlSession.selectOne("mailMapper.getListCount",memNo);
	}

	// 이름 누르고 그 사람에게 메일 보내기 
	public Member mailWriteId(int memNo) {
		return sqlSession.selectOne("memberMapper.mailWriteId",memNo);
	}

	// 받은 편지함 메일 디테일뷰 보기 
	public Mail mailDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.mailDetailView",mailNo);
	}
	// 받은 편지함 - 답장하기 
	public Mail mailReply(int mailNo) {
		return sqlSession.selectOne("mailMapper.mailDetailView",mailNo);
	}
	
	// 조회수 + 1 
	public int updateCount(int mailNo) {
		return sqlSession.update("mailMapper.updateCount",mailNo);
	}

	// 답장하기 - 임시저장 
	public int saveMail(Mail ma) {
		return sqlSession.insert("mailMapper.saveMail",ma);
	}

	// 받은 편지함 - 읽은 메일 
	public ArrayList<Mail> readMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.readMailList",memId,rowBounds);
	}

	// 받은 편지함 - 안읽은 메일 
	public ArrayList<Mail> unReadMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.unReadMailList",memId,rowBounds);
	}

	public ArrayList<Mail> RecieveMailbinList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.recieveMailBin",memId,rowBounds);
	}

	public ArrayList<Mail> selectRmaNo(int memNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectAllNoId",memNo);
	}


	// 받은 편지함 리스트 
	public ArrayList<Mail> selectMailReceiveList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveList",memId,rowBounds);
	}

	// 보낸 편지함 리스트 
	public ArrayList<Mail> selectMailSendList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendList",memId,rowBounds);
	}

	// 보낸 편지함 - 디테일 뷰 
	public Mail sendMailDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.sendMailDetailView",mailNo);
	}

	// 답장하기 - 보내기 
	public int sendMail(Mail ma) {
		return sqlSession.insert("mailMapper.sendMail",ma);
	}

	// 임시보관함 리스트 
	public ArrayList<Mail> mailSaveList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectSaveList",memId,rowBounds);
	}

	// 임시보관함 디테일 뷰 
	public Mail saveDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.saveMailDetailView",mailNo);
	}

	public int allDelMail(String memId) {
		return sqlSession.update("mailMapper.deleteFromList",memId);
	}

	public ArrayList<Mail> binMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.binMailList",memId,rowBounds);
	}

	public int getBinListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getBinListCount",memId);
	}

	

	

	
}

