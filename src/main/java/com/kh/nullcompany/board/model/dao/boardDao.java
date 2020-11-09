package com.kh.nullcompany.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.comment;

@Repository("bDao")
public class boardDao {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   public int getListCount() {
      return sqlSession.selectOne("boardMapper.getListCount");
   }

   public ArrayList<board> selectListImport(PageInfo pi) {
      int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("boardMapper.selectListImport",null,rowBounds);
   }
   
   public ArrayList<board> selectListAll(PageInfo pi) {
      int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("boardMapper.selectListAll",null,rowBounds);
   }

   public ArrayList<board> selectListTeam(PageInfo pi) {
      int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("boardMapper.selectListTeam",null,rowBounds);
   }

   public ArrayList<board> selectListFree(PageInfo pi) {
      int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("boardMapper.selectListFree",null,rowBounds);
   }

   public int updateCount(int bNo) {
      return sqlSession.update("boardMapper.updateCount",bNo);
   }

   public board selectBoard(int bNo) {
      return sqlSession.selectOne("boardMapper.selectBoard",bNo);
   }

   public ArrayList<comment> selectCommentList(int bNo) {
      return (ArrayList)sqlSession.selectList("boardMapper.selectCommentList",bNo);
   }

   public int insertComment(comment c) {
      return sqlSession.insert("boardMapper.insertComment",c);
   }

public int deleteComment(comment c) {
	return sqlSession.update("boardMapper.deleteComment",c);
}


}