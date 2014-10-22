package com.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spr.model.Permission;
import com.spr.service.PermissionService;
import com.spr.service.ProjectService;
import com.spr.service.UserService;

@Controller
@RequestMapping("/permission")
public class PermissionController {
	
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Permission create(
			@RequestParam(value="idUser", required=false) Integer idUser,
			@RequestParam(value="projectId", required=false) Integer projectId,
			@RequestParam(value="view", required=false) boolean view,
			@RequestParam(value="edit", required=false) boolean edit,
			@RequestParam(value="idpermission", required=false) Integer idpermission){
		
		if(idpermission != null && idpermission > 0){
			Permission permission = permissionService.findById(idpermission);
			permission.setEdit(edit);
			permission.setView(view);
			permission.setProject(projectService.findById(projectId));
			permission.setUser(userService.findById(idUser));
			
			return permissionService.update(permission);
		}else{
			Permission permission = new Permission();
			permission.setEdit(edit);
			permission.setView(view);
			permission.setUser(userService.findById(idUser));
			permission.setProject(projectService.findById(projectId));
			
			return permissionService.create(permission);
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public @ResponseBody Permission update(
			@RequestParam(value="idpermission", required=false) Integer idpermission,
			@RequestParam(value="view", required=false) boolean view,
			@RequestParam(value="edit", required=false) boolean edit){
		
		Permission permission = permissionService.findById(idpermission);
		permission.setEdit(edit);
		permission.setView(view);
		
		return permissionService.update(permission);
	}
	
}
