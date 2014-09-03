package com.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spr.exception.UserNotFound;
import com.spr.model.User;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Controller
@SessionAttributes("login")
@RequestMapping("/login")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserSession userSession;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView userLogged(@RequestParam(required = true) String name, String password) {
		
		List<User> users = userService.findAll();
		User userSet = null;
		
		for(User list: users){
			if(list.getName().equals(name) && list.getPassword().equals(password)){
				userSet = list;
				try {
					userSession.logarUser(userSet);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ModelAndView mav = new ModelAndView("logged");
				mav.addObject("userLogged", name);
				mav.setViewName("logged");
				return mav;
			}
		}
		
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("errorLogin", "Usuário e/ou Senha inválido(s)!");
		mav.setViewName("login");
		return mav;
		
	}
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public @ResponseBody String createUser(@ModelAttribute User user){
		userService.create(user);
		return "http://localhost:8080/web-tcc-2014/index.jsp";
	}
	
	@RequestMapping(value="/logout")  
	public String logout() {
		try {
			userSession.logout();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return "http://localhost:8080/web-tcc-2014/index.jsp";  
	}
	
	@RequestMapping(value="/editUserLogged")  
	public ModelAndView editUserLogged() {
		User user = userSession.getUserLogado();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.setViewName("myAccount");
		return mav;
	}
	
	
	@RequestMapping(value="/edit/{userId}",  method = RequestMethod.POST)  
	public ModelAndView editUserLoggedNewInputs(@ModelAttribute User user, @PathVariable int userId) throws Exception {
		
		if(user.getPassword() == null || user.getPassword().trim().equals("")){
			User userOld = userService.findById(userId);
			user.setPassword(userOld.getPassword());
		}
		
		user.setId(userId);
		try {
			userService.update(user);
			userSession.logout();
			userSession.logarUser(user);
		} catch (UserNotFound e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User userView = userService.findById(user.getId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", userView);
		mav.setViewName("myAccount");
		return mav;
	}
	
}
