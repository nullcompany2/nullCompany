package com.kh.nullcompany.logo.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullcompany.logo.model.dao.LogoDao;
import com.kh.nullcompany.logo.model.vo.Logo;

@Service("lService")
public class LogoServiceImpl implements LogoService {

		@Autowired
		private LogoDao lDao;

		// 로고 등록하기 
		@Override
		public int logoUpload(Logo l) {
			return lDao.logoUpload(l);
		}

		// 메인에 로고 불러오기 
		@Override
		public Logo logoSelect() {
			return lDao.logoSelect();
		}
}
