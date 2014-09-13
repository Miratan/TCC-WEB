package com.spr.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spr.model.Project;
import com.spr.model.User;
import com.spr.model.UserProject;
import com.spr.repository.UserProjectRepository;
import com.spr.service.ProjectService;
import com.spr.session.UserSession;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserSession userSession;
	
	@Autowired
	private UserProjectRepository userProjectRepository;
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public @ResponseBody ModelAndView createProject(@ModelAttribute Project project){
		projectService.create(project);
		
		
		ModelAndView mav = new ModelAndView("logged");
		mav.addObject("msg", "Projeto criado com sucesso!");
		mav.setViewName("logged");
		return mav;
	}
	
	
//	@RequestMapping(value="/findUserLogged")
//	public @ResponseBody ModelAndView getProjectUserLogged(){
//		List<UserProject> userProject = null;
//		User user = userSession.getUserLogado();
//		if(user.getId() != null){
//			if(userProject == null){
//				userProject = new ArrayList<UserProject>();
//			}
//			userProject = userProjectRepository.findAll();
//		}
//		
//		userProjectRepository.
//		
//		ModelAndView mav = new ModelAndView("myProjects");
//		mav.addObject("myProjects", userProject);
//		mav.setViewName("myProjects");
//		return mav;
//	}
	
}
