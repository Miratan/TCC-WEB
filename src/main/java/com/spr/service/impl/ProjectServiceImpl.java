package com.spr.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spr.exception.ProjectNotFound;
import com.spr.model.File;
import com.spr.model.Note;
import com.spr.model.Permission;
import com.spr.model.Project;
import com.spr.modelGeneric.ProjectView;
import com.spr.repository.ProjectRepository;
import com.spr.service.FileService;
import com.spr.service.NoteService;
import com.spr.service.PermissionService;
import com.spr.service.ProjectService;
import com.spr.service.UserService;
import com.spr.session.UserSession;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private PermissionService permissionService;
	
	@Resource
	private ProjectRepository projectRepository;
	
	@Resource
	private FileService fileService;
	
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

	@Override
	public List<ProjectView> infoProject(Project project) {
		ProjectView pv = new ProjectView();
		List<ProjectView> pview = new ArrayList<ProjectView>();
		List<Note> note = noteService.findByProjectId(project.getProjectId());
		pv.setDeliveryDate(project.getDeliveryDate());
		pv.setDescription(project.getDescription());
		pv.setProjectId(project.getProjectId());
		pv.setTitle(project.getTitle());
		pv.setNote(note);
		
		List<File> files = fileService.findByProjectId(project.getProjectId());
		List<Permission> permi = permissionService.findUsersInProject(project.getProjectId());
		List<String> user = new ArrayList<String>();
		for(Permission list : permi){
			if(!list.getUser().getUserId().equals(userSession.getUserLogado().getUserId())){
				user.add(list.getUser().getName());
			}
		}
		pv.setFile(files);
		pv.setUser(user);
		pview.add(pv);
		return pview;
	}

}
