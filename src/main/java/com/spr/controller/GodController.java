package com.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spr.model.Project;
import com.spr.model.User;
import com.spr.service.ProjectService;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Controller
@RequestMapping("/god")
public class GodController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserSession userSession;
	
	@RequestMapping(value="/logout")  
	public @ResponseBody ModelAndView logout() {
		try {
			userSession.logout();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("errorLogin", "Sessão finalizada!");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/userLogged", method = RequestMethod.GET)
	public @ResponseBody String userLogged() {
		String response = "";
		response = userSession.getUserLogado().getNameUser().toString();
		return response;
	}
	
	@RequestMapping(value = "/allUser", method = RequestMethod.GET)
	public @ResponseBody List<User> allUser() {
		return userService.findAll();
	}
	
	@RequestMapping(value = "/allProject", method = RequestMethod.GET)
	public @ResponseBody List<Project> allProject() {
		return projectService.findAll();
	}
	
}
