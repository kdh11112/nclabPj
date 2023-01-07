package org.nc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nc.domain.InsaVO;
import org.nc.service.InsaService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/eHR/*")
@Log4j
public class InsaController {

	private final InsaService service;
	
	@RequestMapping("/Insa")
	 public String Insa() {
	  return "/eHR/management/Insa";
	}
	
//	@GetMapping("/listretrieve/listResult")
	@RequestMapping(value = "/listretrieve/listResult", method = RequestMethod.GET)
	public void list(Model model ) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
			//Model에 BoardVO의 목록을 담아서 전달
		model.addAttribute("list",service.ListResult());
	}



	
	@RequestMapping("/listretrieve/listResult")
	public void searchList(Model model, HttpServletRequest reuqest) {
		
		String sDateStart = reuqest.getParameter("shDateStart");
		String sDateend = reuqest.getParameter("shDateEnd");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date shDateStart = sdf.parse(sDateStart);
			Date shDateEnd = sdf.parse(sDateend);
			reuqest.setAttribute("shDateStart", shDateStart);
			reuqest.setAttribute("shDateEnd", shDateEnd);
			reuqest.setAttribute("list", service.ListSearch(shDateEnd, shDateStart));
			
		} catch(Exception e) {
			System.out.println("파싱안됨");
		}
		
		
	}
	
}
