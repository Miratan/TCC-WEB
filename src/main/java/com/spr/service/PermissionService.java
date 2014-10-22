package com.spr.service;

import com.spr.model.Permission;

public interface PermissionService {
	
	public Permission create(Permission permission);
	public Permission findPermission(int id, int userId);
//	public Permission delete(int id);
//	public List<Permission> findAll();
	public Permission update(Permission permission);
	public Permission findById(int id);
//	public List<Permission> findAllByUserId(Integer userId);

}
