package com.spr.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spr.model.Permission;
import com.spr.model.Project;
import com.spr.modelGeneric.ProjectWithPermission;
import com.spr.repository.PermissionRepository;
import com.spr.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {
	
	@Resource
	private PermissionRepository permissionRepository;
	
	List<ProjectWithPermission> projectWithPermission;
	
	@Override
	public Permission create(Permission permission) {
		return permissionRepository.save(permission);
	}

	@Override
	public Permission findPermission(int id, int userId) {
		return permissionRepository.findPermission(id, userId);
	}

	@Override
	public Permission update(Permission permission) {
		permissionRepository.saveAndFlush(permission);
		return permissionRepository.findPermission(permission.getProject().getProjectId(), permission.getUser().getUserId());
	}

	@Override
	public Permission findById(int id) {
		return permissionRepository.findOne(id);
	}

	@Override
	public List<ProjectWithPermission> permissionInProject(List<Project> p) {
		
		projectWithPermission = new ArrayList<ProjectWithPermission>();
		
		for(int i = 0; i < p.size(); i++){
			List<Permission> pe = permissionRepository.findProjectPermission(p.get(i).getProjectId());
			
			ProjectWithPermission pp = new ProjectWithPermission();
			pp.setDeliveryDate(p.get(i).getDeliveryDate());
			pp.setDescription(p.get(i).getDescription());
			pp.setEdit(pe.get(i).getEdit());
			pp.setProjectId(p.get(i).getProjectId());
			pp.setTitle(p.get(i).getTitle());
			pp.setView(pe.get(i).getView());
			
			projectWithPermission.add(pp);
		}
		
//		for(Project list: p){
//			List<Permission> pe = (List<Permission>) permissionRepository.findProjectPermission(list.getProjectId());
//			
//			ProjectWithPermission pp = new ProjectWithPermission();
//			pp.setDeliveryDate(list.getDeliveryDate());
//			pp.setDescription(list.getDescription());
//			pp.setEdit(pe.getEdit());
//			pp.setProjectId(list.getProjectId());
//			pp.setTitle(list.getTitle());
//			pp.setView(pe.getView());
//			
//		}
		return projectWithPermission;
	}

	@Override
	public List<Permission> findUsersInProject(int id) {
		return permissionRepository.findUsersInProject(id);
	}

}
