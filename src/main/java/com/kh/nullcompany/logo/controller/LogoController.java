package com.kh.nullcompany.logo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.nullcompany.logo.model.service.LogoService;

@Controller
public class LogoController {
		
		@Autowired
		private LogoService lService;
		
}
