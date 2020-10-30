package com.kh.nullcompany.reservation.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class reservationController {
	
	@RequestMapping("reservation.do")
	public String reservation(HttpServletResponse response) {
		return "reservation/reservation";
	}
	
	@RequestMapping("categoryInsert.do")
	public String categoryInsert(HttpServletResponse response) {
		return "reservation/categoryInsert";
	}
	
	@RequestMapping("categoryList.do")
	public String categoryList(HttpServletResponse response) {
		return "reservation/categoryList";
	}
	@RequestMapping("categoryUpdate.do")
	public String categoryUpdate(HttpServletResponse response) {
		return "reservation/categoryUpdate";
	}
	@RequestMapping("myReservation.do")
	public String myReservation(HttpServletResponse response) {
		return "reservation/myReservation";
	}
	@RequestMapping("reservationList.do")
	public String reservationList(HttpServletResponse response) {
		return "reservation/reservationList";
	}
	@RequestMapping("reservationManager.do")
	public String reservationManager(HttpServletResponse response) {
		return "reservation/reservationManager";
	}
	@RequestMapping("resourceList.do")
	public String resourceList(HttpServletResponse response) {
		return "reservation/resourceList";
	}
	@RequestMapping("resourceInsert.do")
	public String resourceInsert(HttpServletResponse response) {
		return "reservation/resourceInsert";
	}
	@RequestMapping("resourceUpdate.do")
	public String resourceUpdate(HttpServletResponse response) {
		return "reservation/resourceUpdate";
	}
	@RequestMapping("returnList.do")
	public String returnList(HttpServletResponse response) {
		return "reservation/returnList";
	}
}
