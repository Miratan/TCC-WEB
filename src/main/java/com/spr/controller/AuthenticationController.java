package com.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spr.model.User;
import com.spr.service.AuthenticationService;
import com.spr.session.UserSession;

@Controller
@SessionAttributes("authentication")
@RequestMapping("/authentication")
public class AuthenticationController {
	
	@Autowired
	private AuthenticationService authenticationService;
	
	@Autowired
	private UserSession userSession;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView authentication(@RequestParam(required = true) String username, String password){
		
		User user =  authenticationService.authentication(username, password);
		try {
			userSession.logarUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user != null){
			ModelAndView mav = new ModelAndView("myProjects");
			mav.setViewName("myProjects");
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("errorLogin", "Usuário e/ou Senha inválido(s)!");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value="/logout")  
	public @ResponseBody ModelAndView logout() {
		try {
			userSession.logout();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("errorLogin", "Sessão encerrada!");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/userLogged", method = RequestMethod.GET)
	public @ResponseBody String userLogged() {
		return userSession.getUserLogado().getName().toString();
	}
	
}
