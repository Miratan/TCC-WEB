package com.spr.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spr.exception.ProjectNotFound;
import com.spr.model.Project;
import com.spr.model.UserProject;
import com.spr.model.UserProjectId;
import com.spr.repository.ProjectRepository;
import com.spr.repository.UserProjectRepository;
import com.spr.session.UserSession;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Resource
	private ProjectRepository projectRepository;
	
	@Resource
	private UserProjectRepository userProjectRepository;

	@Autowired
	private UserSession userSession;
	
	@Override
	@Transactional
	public Project create(Project project){
		Project createdProject = project;
		
		projectRepository.save(createdProject);
		
		UserProjectId id = new UserProjectId();
		id.setProject(createdProject);
		id.setUser(userSession.getUserLogado());
		
		UserProject userProject = new UserProject();
		userProject.setId(id);
		
		userProjectRepository.save(userProject);
		
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
		Project updatedProject = projectRepository.findOne(project.getId());
		
		if(updatedProject == null)
			throw new ProjectNotFound();
		
		updatedProject.setDeliveryDate(project.getDeliveryDate());
		updatedProject.setDescription(project.getDescription());
		updatedProject.setDiscipline(project.getDiscipline());
		updatedProject.setKeyWords(project.getKeyWords());
		updatedProject.setTitle(project.getTitle());
			
		return updatedProject;
	}

}
