package com.kh.nullcompany.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.kh.nullcompany.reservation.model.vo.Reservation;
import com.kh.nullcompany.reservation.model.vo.Resource;

@Controller
public class reservationController {

	@Autowired
	private ReservationService rService;

	@RequestMapping("reservation.do")
	public ModelAndView reservation(ModelAndView mv,int rcNo) {
		/* ArrayList<Reservation> list = rService.selectReservationList(rcNo); */
		ArrayList<Resource> r = rService.selectResourceList(rcNo);
		System.out.println(r);
		/* mv.addObject("list",list); */
		mv.addObject("r",r);
		mv.addObject("c",rService.selectUpdateCategory(rcNo));
		mv.setViewName("reservation/reservation");
		return mv;
	}

	@RequestMapping("reservation2.do")
	public void reservation2(HttpServletResponse response,int rcNo,int rsNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		Map map = new HashMap();
		map.put("rcNo", rcNo);
		map.put("rsNo", rsNo);
		ArrayList<Reservation> list = rService.selectReservationList(map);
		System.out.println(list);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}

	@RequestMapping("reservation3.do")
	public void reservation3(HttpServletResponse response,int rsNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		Resource r = rService.selectUpdateResource(rsNo);
		System.out.println(r);
		Gson gson = new GsonBuilder().create();
		gson.toJson(r,response.getWriter());
	}

	@RequestMapping("insertReservation.do")
	public String insertReservation(HttpServletResponse response,Reservation r) throws JsonIOException, IOException {
		r.getRcNo();
		int result = rService.insertReservation(r);
		System.out.println(result);
		if(result>0) {
			return "redirect:reservation.do?rcNo="+r.getRcNo();
		}else {
			return "common/errorPage";
		}
	}

	@RequestMapping("subNavi2.do")
	public void subNavi(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Category> m = rService.selectCategoryList();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
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
		System.out.println(list);
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
	public ModelAndView myReservation(ModelAndView mv, String rMember) {
		ArrayList<Reservation> list = rService.selectMyreservationList(rMember);
		System.out.println(list);
		mv.addObject("list",list);
		mv.setViewName("reservation/myReservation");
		return mv;
	}

	@RequestMapping("reservationList.do")
	public ModelAndView reservationList(ModelAndView mv) {
		ArrayList<Resource> r = rService.selectResourceList();
		ArrayList<Category> c = rService.selectCategoryList();
		mv.addObject("r",r);
		mv.addObject("c",c);
		mv.setViewName("reservation/reservationList");
		return mv;
	}
	@RequestMapping("reservationList2.do")
	public void reservationList2(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Reservation> list = rService.selectReservationList();
		Gson gson = new GsonBuilder().create();
		gson.toJson(list,response.getWriter());
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

	@RequestMapping("List.do")
	public void resourceList2(HttpServletResponse response, int rcNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		System.out.println(rcNo);
		ArrayList<Resource> m = rService.selectResourceList(rcNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
	}

	@RequestMapping("resourceInsertView.do")
	public ModelAndView resourceInsertView(ModelAndView mv, HttpServletResponse response, int rcNo) {
		mv.addObject("rcNo",rcNo);
		mv.setViewName("reservation/resourceInsert");
		return mv;
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
	public ModelAndView resourceUpdate(ModelAndView mv,HttpServletRequest request, Resource r) {
		System.out.println(r);
		int result = rService.updateResouce(r);

		System.out.println(result);
		if(result>0) {
			mv.setViewName("redirect:resourceList.do");
		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping("resourceUpdateView.do")
	public ModelAndView resourceUpdateView (ModelAndView mv, int rsNo){

		mv.addObject("r",rService.selectUpdateResource(rsNo)).setViewName("reservation/resourceUpdate");
		System.out.println(mv);
		return mv;
	}
	@RequestMapping("resourceDelete.do")
	public String deleteResource(int rsNo,HttpServletRequest requset) {
		int result = rService.deleteResource(rsNo);
		if(result>0) {
			return "redirect:resourceList.do";
		}else {
			return "common/errorPage";
		}
	}

	@RequestMapping("returnList.do")
	public String returnList(HttpServletResponse response) {
		return "reservation/returnList";
	}

	@RequestMapping("reservationReturn.do")
	public String reservationReturn(HttpServletResponse response,HttpServletRequest request, int rNo,String rMember) {
		int result = rService.reservationReturn(rNo);
		String referer = request.getHeader("Referer");
		if(result>0) {
			return "redirect:"+referer;
		}else {
			return "common/errorPage";
		}
	}
}
