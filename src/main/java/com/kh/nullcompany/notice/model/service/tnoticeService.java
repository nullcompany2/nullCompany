package com.kh.nullcompany.notice.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.vo.tcomment;
import com.kh.nullcompany.notice.model.vo.tnotice;

public interface tnoticeService {

	int getListCount();

	ArrayList<tnotice> selectListtNotice(PageInfo pi);

	tnotice selecttNotice(int tNo);

	ArrayList<tcomment> selecttCommenList(int tNo);

	int inserttComment(tcomment c);

	int inserttNotice(tnotice t);

	ArrayList<tnotice> tnoticeList();

	tnotice selectUpdatetNotice(int tNo);

	int updatetNotice(tnotice t);

	int deletetNotice(int tNo);

}
