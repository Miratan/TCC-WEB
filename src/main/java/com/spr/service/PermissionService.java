package com.spr.service;

import java.util.List;
import com.spr.model.Permission;
import com.spr.model.Project;
import com.spr.modelGeneric.ProjectWithPermission;

public interface PermissionService {
	
	public Permission create(Permission permission);
	public Permission findPermission(int id, int userId);
	public Permission update(Permission permission);
	public Permission findById(int id);
	public List<ProjectWithPermission> permissionInProject(List<Project> p);

}
