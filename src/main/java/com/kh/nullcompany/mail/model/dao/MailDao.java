package com.kh.nullcompany.mail.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.MailListCount;
import com.kh.nullcompany.member.model.vo.Member;

@Repository("maDao")
public class MailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private int result;
	

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
	
	public ArrayList<Mail> binMailList(PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.binMailList",memId,rowBounds);
	}


	public Mail delMailDetailView(int mailNo) {
		return sqlSession.selectOne("mailMapper.delMailDetailView",mailNo);
	}

	public int allBinDelMail(String memId) {
		return sqlSession.update("mailMapper.allBinDelMail",memId);
	}

	public Member findIdName(String recipient) {
		return sqlSession.selectOne("memberMapper.findIdName",recipient);
	}

	public int allRealDelMail(String memId) {
		return sqlSession.update("mailMapper.allRealDelMail",memId);
	}

	public int deleteOneMail(int mailNo) {
		return sqlSession.update("mailMapper.deleteOneMail",mailNo);
	}

	public int realDeleteOneMail(int mailNo) {
		return sqlSession.update("mailMapper.realDeleteOneMail",mailNo);
	}

	// 받은 메일함 편지 갯수 세기 
	public int getReListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getReListCount",memId);
	}
	
	// 쓰레기통 편지 갯수 세기 
	public int getBinListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getBinListCount",memId);
	}

	// 보낸 메일함 편지 갯수 세기 
	public int getSendListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getSendListCount",memId);
	}

	// 임시보관함 편지 갯수 세기 
	public int getSaveListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getSaveListCount",memId);
	}

	public ArrayList<Member> autoComplete(String text) {
		return(ArrayList) sqlSession.selectList("memberMapper.autoComplete",text);
	}

	public int backMail(int mailNo) {
		return sqlSession.update("mailMapper.backOneMail",mailNo);
	}

	// 안읽은 메일 세기 
	public int getReReListCount(String memId) {
		return sqlSession.selectOne("mailMapper.getReUnreadListCount",memId);
	}

	// 메일에 카운트 에이작스 뿌리기 
	public MailListCount getMailBoxCount(String memId) {
		return sqlSession.selectOne("mailMapper.mailListCount",memId);
	}

	public ArrayList<Mail> searchTitle(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchTitle",map);
	}

	public ArrayList<Mail> searchRecipient(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchRecipient",map);
	}

	public ArrayList<Mail> searchMcontent(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchMcontent",map);
	}

	public ArrayList<Mail> searchMtitleContent(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchMtitleContent",map);
	}

	public ArrayList<Mail> searchSendTitle(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchSendTitle",map);
	}

	public ArrayList<Mail> searchSendMcontent(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchSendMcontent",map);
	}

	public ArrayList<Mail> searchSendMtitleContent(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchSendMtitleContent",map);
	}

	public ArrayList<Mail> searchSender(Map map) {
		return (ArrayList)sqlSession.selectList("mailMapper.searchSender",map);
	}

	public int delmail(String[] mailNon) {
		
		int result = 0;
		
		for(int i =0; i<mailNon.length; i++) {
			result = sqlSession.update("mailMapper.delMail",mailNon[i]);
			System.out.println(mailNon[i]);
			if(result < 0) {
				return result;
			}
		}
		
			return result;
	}

	public int realDelMail(String[] mailNon) {
		int result = 0;
		
		for(int i =0; i<mailNon.length; i++) {
			result = sqlSession.update("mailMapper.realDelMail",mailNon[i]);
			System.out.println(mailNon[i]);
			if(result < 0) {
				return result;
			}
		}
		
			return result;
	}
	
}
