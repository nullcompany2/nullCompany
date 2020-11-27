package com.kh.nullcompany.logo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullcompany.logo.model.dao.LogoDao;

@Service("lService")
public class LogoServiceImpl implements LogoService {

		@Autowired
		private LogoDao lDao;

		@Override
		public int logoUpload(String logoFileName) {
			return lDao.logoUpload(logoFileName);
		}
}
