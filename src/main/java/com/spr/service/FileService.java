package com.spr.service;

import java.util.List;

import com.spr.model.File;

public interface FileService {
	
	public File create(File file);
	public List<File> findByProjectId(Integer projectId);
	public File delete(int id);
//	public List<Project> findAll();
//	public Project update(Project project) throws ProjectNotFound;
//	public Project findById(int id);
//	public List<Note> findByProjectId(Integer projectId);

}
