package com.spr.service;

import java.util.List;

import com.spr.exception.ProjectNotFound;
import com.spr.model.Project;

public interface ProjectService {
	
	public Project create(Project project);
	public Project delete(int id) throws ProjectNotFound;
	public List<Project> findAll();
	public Project update(Project project) throws ProjectNotFound;
	public Project findById(int id);
	public List<Project> findAllByUserId(Integer userId);
	public List<Project> collaborativeProjects(Integer userId);
	
}
