package com.kh.nullcompany.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.SaveMail;
import com.kh.nullcompany.member.model.vo.Member;

@Repository("maDao")
public class MailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 받은 메일함 리스트 뽑기 
	public ArrayList<Mail> selectMailReceiveList(PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveList",memNo,rowBounds);
	}

	// 받은 메일함 리스트 갯수 카운트 
	public int getListCount(int memNo) {
		return sqlSession.selectOne("mailMapper.getListCount",memNo);
	}

	// 이름 누르고 그 사람에게 메일 보내기 
	public Member mailWriteId(int senderNo) {
		return sqlSession.selectOne("memberMapper.mailWriteId",senderNo);
	}

	public Mail mailDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.mailDetailView",mailNo);
	}

	public Mail mailReply(int mailNo) {
		return sqlSession.selectOne("mailMapper.mailDetailView",mailNo);
	}

	public int updateCount(int mailNo) {
		return sqlSession.update("mailMapper.updateCount",mailNo);
	}

	public int saveMail(Mail ma) {
		return sqlSession.insert("mailMapper.saveMail",ma);
	}

	public ArrayList<SaveMail> mailSaveList(PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.saveMailList",memNo,rowBounds);
	}

	public SaveMail saveDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.saveDetailView",mailNo);
	}

	public ArrayList<Mail> readMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.readMailList",memId,rowBounds);
	}

	public ArrayList<Mail> unReadMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.unReadMailList",memId,rowBounds);
	}

	public int allDelMail(int memNo) {
		return sqlSession.update("mailMapper.allInsertMailBin",memNo);
	}

	public ArrayList<Mail> RecieveMailbinList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.recieveMailBin",memId,rowBounds);
	}
	
}

