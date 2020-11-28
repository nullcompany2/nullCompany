package com.kh.nullcompany.logo.model.service;

import com.kh.nullcompany.logo.model.vo.Logo;

public interface LogoService {

	// 로고 등록하기 
	int logoUpload(Logo l);

	// 메인 불러올때 로고 가져오기 
	Logo logoSelect();

}
