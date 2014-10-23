package com.spr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spr.exception.ProjectNotFound;
import com.spr.model.Project;
import com.spr.repository.ProjectRepository;
import com.spr.service.ProjectService;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Resource
	private ProjectRepository projectRepository;
	
	@Autowired
	private UserSession userSession;
	
	@Autowired
	private UserService userService;
	
	@Override
	@Transactional
	public Project create(Project project){
		Project createdProject = project;
		createdProject.setUser(userService.findById(userSession.getUserLogado().getUserId()));
		projectRepository.save(createdProject);
		return createdProject;
	}

	@Override
	@Transactional
	public Project findById(int id){
		return projectRepository.findOne(id);
	}

	@Override
	public Project delete(int id) throws ProjectNotFound {
		Project deleteProject = projectRepository.findOne(id);
		if(deleteProject == null){
			throw new ProjectNotFound();
		}
		projectRepository.delete(deleteProject);
		return deleteProject;
	}

	@Override
	public List<Project> findAll() {
		return projectRepository.findAll();
	}

	@Override
	public Project update(Project project) throws ProjectNotFound {
		Project updatedProject = projectRepository.findOne(project.getProjectId());
		
		if(updatedProject == null)
			throw new ProjectNotFound();
		
		updatedProject.setDeliveryDate(project.getDeliveryDate());
		updatedProject.setDescription(project.getDescription());
		updatedProject.setDiscipline(project.getDiscipline());
		updatedProject.setKeyWords(project.getKeyWords());
		updatedProject.setTitle(project.getTitle());
		
		projectRepository.saveAndFlush(updatedProject);
			
		return updatedProject;
	}

	@Override
	@Transactional
	public List<Project> findAllByUserId(Integer userId) {
		return projectRepository.findByUserId(userId);
	}

	@Override
	public List<Project> collaborativeProjects(Integer userId) {
		return projectRepository.collaborativeProject(userId);
	}

}
