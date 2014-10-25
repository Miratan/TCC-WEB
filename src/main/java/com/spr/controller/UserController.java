package com.spr.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spr.exception.UserNotFound;
import com.spr.model.User;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Controller
//@SessionAttributes("user")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserSession userSession;

	@RequestMapping(value="/create", method = RequestMethod.POST)
	public @ResponseBody ModelAndView createUser(@ModelAttribute User user){
		userService.create(user);
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("errorLogin", "Cadastro realizado com sucesso!");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value="/editUserLogged")  
	public ModelAndView editUserLogged() {
		User user = userSession.getUserLogado();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.setViewName("myAccount");
		return mav;
	}
	
	
	@RequestMapping(value="/edit",  method = RequestMethod.POST)  
	public @ResponseBody User editUserLoggedNewInputs(
			@RequestParam(value="username", required=false) String username,
			@RequestParam(value="password", required=false) String password,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="birthday", required=false) Date birthday,
			@RequestParam(value="city", required=false) String city,
			@RequestParam(value="course", required=false) String course,
			@RequestParam(value="semester", required=false) String semester,
			@RequestParam(value="college", required=false) String college,
			@RequestParam(value="country", required=false) String country) {
		
		User user = new User();
		user.setBirthday(birthday);
		user.setCity(city);
		user.setCollege(college);
		user.setCountry(country);
		user.setCourse(course);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setSemester(semester);
		user.setUsername(username);
		
		if(user.getPassword().equals("*****")){
			User userOld = userService.findById(userSession.getUserLogado().getUserId());
			user.setPassword(userOld.getPassword());
		}
		
		user.setUserId(userSession.getUserLogado().getUserId());
		try {
			userService.update(user);
		} catch (UserNotFound e) {
			e.printStackTrace();
		}
		User userView = userService.findById(user.getUserId());
		return userView;
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public @ResponseBody User user() {
		
		User user = userSession.getUserLogado();
		return user;
	}
	
	@RequestMapping(value = "/allUser", method = RequestMethod.GET)
	public @ResponseBody List<User> allUser() {
		return userService.findAll();
	}
	
	@RequestMapping(value = "/allUserWithoutLogged", method = RequestMethod.GET)
	public @ResponseBody List<User> allUserWithoutLogged() {
		return userService.findAllWithoutLogged(userSession.getUserLogado().getUserId());
	}
	
	@RequestMapping(value = "/search/{valueToSearch}", method = RequestMethod.GET)
	public @ResponseBody List<User> getUser(@PathVariable String valueToSearch) {
		return userService.findByName(valueToSearch);
	}
	
	@RequestMapping(value="/userId/{id}", method = RequestMethod.GET)
	public @ResponseBody User getUserById(@PathVariable int id){
		return userService.findById(id);
	}
	
}
