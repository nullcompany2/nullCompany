package com.kh.nullcompany.logo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.logo.model.dao.LogoDao;

@Service("lService")
public class LogoServiceImpl implements LogoService {

		@Autowired
		private LogoDao lDao;
}
