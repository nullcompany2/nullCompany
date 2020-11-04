package com.kh.nullcompany.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.service.boardService;
import com.kh.nullcompany.reservation.model.service.ReservationService;
import com.kh.nullcompany.reservation.model.vo.Category;
import com.kh.nullcompany.reservation.model.vo.Resource;

@Controller
public class reservationController {
	
	@Autowired
	private ReservationService rService;
	
	@RequestMapping("reservation.do")
	public String reservation(HttpServletResponse response) {
		return "reservation/reservation";
	}
	
	@RequestMapping("categoryInsertView.do")
	public String categoryInsertView(HttpServletResponse response) {
		return "reservation/categoryInsert";
	}
	@RequestMapping("categoryInsert.do")
	public String categoryInsert(Category c, HttpServletRequest request) {
		int result = rService.insertCategory(c);
		
		System.out.println(result);
		if(result>0) {
			return "redirect:categoryList.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("categoryList.do")
	public ModelAndView categoryList(ModelAndView mv) {
		
		ArrayList<Category> list = rService.selectCategoryList();
		mv.addObject("list",list);
		mv.setViewName("reservation/categoryList");
		return mv;
	}
	@RequestMapping("categoryUpdateView.do")
	public ModelAndView categoryUpdateView (ModelAndView mv, int rcNo){
		
		mv.addObject("c",rService.selectUpdateCategory(rcNo)).setViewName("reservation/categoryUpdate");
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping("categoryUpdate.do")
	public ModelAndView categoryUpdate (ModelAndView mv, Category c,
			HttpServletRequest request) {
		int result = rService.updateCategory(c);
		System.out.println(result);
		if(result>0) {
			mv.setViewName("redirect:categoryList.do");
		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping("categoryDelete.do")
	public String deleteCategoty(int rcNo,HttpServletRequest requset) {
		int result = rService.deleteCategory(rcNo);
		System.out.println(result);
		if(result>0) {
			return "redirect:categoryList.do";
		}else {
			return "common/errorPage";
		}
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
	public ModelAndView resourceList(ModelAndView mv) {
		ArrayList<Resource> r = rService.selectResourceList();
		ArrayList<Category> c = rService.selectCategoryList();
		mv.addObject("r",r);
		mv.addObject("c",c);
		mv.setViewName("reservation/resourceList");
		return mv;
	}
	
	@RequestMapping("resourceList2.do")
	public void resourceList2(HttpServletResponse response) throws JsonIOException, IOException {
	
		System.out.println("2");
		response.setContentType("application/json; charset=utf-8");
		String m = "2";
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
	}
	
	@RequestMapping("resourceInsertView.do")
	public String resourceInsertView(HttpServletResponse response) {
		return "reservation/resourceInsert";
	}
	@RequestMapping("resourceInsert.do")
	public String resourceInsert(Resource r, HttpServletRequest request) {
		int result = rService.insertResource(r);
		System.out.println(result);
		if(result>0) {
			return "redirect:resourceList.do";
		}else {
			return "common/errorPage";
		}
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
