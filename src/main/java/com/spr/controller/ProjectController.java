package com.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spr.model.Project;
import com.spr.repository.ProjectRepository;
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
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public @ResponseBody ModelAndView createProject(@ModelAttribute Project project){
		projectService.create(project);
		
		
		ModelAndView mav = new ModelAndView("logged");
		mav.addObject("msg", "Projeto criado com sucesso!");
		mav.setViewName("logged");
		return mav;
	}
	
	
	@RequestMapping(value="/findUserLogged")
	public @ResponseBody ModelAndView getProjectUserLogged(){
		
		Project projects = projectRepository.findOne(2);
		
		ModelAndView mav = new ModelAndView("myProjects");
		mav.addObject("myProjects", projects);
		mav.setViewName("myProjects");
		return mav;
	}
	
}
