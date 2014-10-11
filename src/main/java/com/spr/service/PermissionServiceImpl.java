package com.spr.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.spr.model.Permission;
import com.spr.repository.PermissionRepository;

@Service
public class PermissionServiceImpl implements PermissionService {
	
	@Resource
	private PermissionRepository permissionRepository;
	
	@Override
	public Permission create(Permission permission) {
		return permissionRepository.save(permission);
	}

//	@Override
//	public Permission delete(int id) {
//	}
//
//	@Override
//	public List<Permission> findAll() {
//	}
//
//	@Override
//	public Permission update(Permission permission) {
//	}
//
//	@Override
//	public Permission findById(int id) {
//	}
//
//	@Override
//	public List<Permission> findAllByUserId(Integer userId) {
//	}
	
//	@Override
//	@Transactional
//	public Project create(Project project){
//		Project createdProject = project;
//		createdProject.setUser(userService.findById(userSession.getUserLogado().getUserId()));
////		createdProject.setUser(userSession.getUserLogado());
//		projectRepository.save(createdProject);
////		UserProjectId id = new UserProjectId();
////		id.setProject(createdProject);
////		id.setUser(userSession.getUserLogado());
////		
////		UserProject userProject = new UserProject();
////		userProject.setId(id);
////		
////		userProjectRepository.save(userProject);
//		
//		return createdProject;
//	}
//
//	@Override
//	@Transactional
//	public Project findById(int id){
//		return projectRepository.findOne(id);
//	}
//
//	@Override
//	public Project delete(int id) throws ProjectNotFound {
//		Project deleteProject = projectRepository.findOne(id);
//		
//		if(deleteProject == null){
//			throw new ProjectNotFound();
//		}
//		
//		projectRepository.delete(deleteProject);
//		
//		return deleteProject;
//	}
//
//	@Override
//	public List<Project> findAll() {
//		return projectRepository.findAll();
//	}
//
//	@Override
//	public Project update(Project project) throws ProjectNotFound {
//		Project updatedProject = projectRepository.findOne(project.getProjectId());
//		
//		if(updatedProject == null)
//			throw new ProjectNotFound();
//		
//		updatedProject.setDeliveryDate(project.getDeliveryDate());
//		updatedProject.setDescription(project.getDescription());
//		updatedProject.setDiscipline(project.getDiscipline());
//		updatedProject.setKeyWords(project.getKeyWords());
//		updatedProject.setTitle(project.getTitle());
//		
//		projectRepository.saveAndFlush(updatedProject);
//			
//		return updatedProject;
//	}
//
//	@Override
//	@Transactional
//	public List<Project> findAllByUserId(Integer userId) {
//		return projectRepository.findByUserId(userId);
//	}

}
