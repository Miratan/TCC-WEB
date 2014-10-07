package com.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spr.exception.ProjectNotFound;
import com.spr.model.Project;
import com.spr.model.User;
import com.spr.repository.ProjectRepository;
import com.spr.service.ProjectService;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Controller
@SessionAttributes("login")
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserSession userSession;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public @ResponseBody ModelAndView createProject(@ModelAttribute Project project){
		projectService.create(project);
		
		
		ModelAndView mav = new ModelAndView("indexUser");
		mav.addObject("msg", "Projeto criado com sucesso!");
		mav.setViewName("indexUser");
		return mav;
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public @ResponseBody ModelAndView updateProject(@RequestBody Project project){
		
		try {
			projectService.update(project);
		} catch (ProjectNotFound e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("myProjects");
		mav.addObject("msg", "Projeto Alterado com sucesso!");
		mav.setViewName("myProjects");
		return mav;
	}
	
	
	@RequestMapping(value="/findUserLogged", method = RequestMethod.GET)
	public @ResponseBody List<Project> getProjectUserLogged(){
		User user = userService.findById(userSession.getUserLogado().getUserId());
		return (List<Project>) projectService.findAllByUserId(user.getUserId());
//		return projectRepository.findByUserId(user.getUserId());
	}
	
	@RequestMapping(value = "/allProject", method = RequestMethod.GET)
	public @ResponseBody List<Project> allProject() {
		User user = userService.findById(userSession.getUserLogado().getUserId());
		return projectRepository.findByUserId(user.getUserId());
	}
	
	
	@RequestMapping(value="/deleteProject/{projectId}", method = RequestMethod.DELETE)
	public @ResponseBody List<Project> deleProjectGetProjects(@PathVariable Integer projectId){
		
		try {
			projectService.delete(projectId);
		} catch (ProjectNotFound e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user = userService.findById(userSession.getUserLogado().getUserId());
		return (List<Project>) projectService.findAllByUserId(user.getUserId());
	}
	
	
	
	@RequestMapping(value="/findById/{id}", method = RequestMethod.GET)
	public @ResponseBody Project getProjectById(@PathVariable Integer id){
		return projectService.findById(id);
	}
	
}
