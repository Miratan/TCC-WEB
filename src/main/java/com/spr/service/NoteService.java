package com.spr.service;

import java.util.List;

import com.spr.model.Note;

public interface NoteService {
	
	public Note create(Note note);
//	public Project delete(int id) throws ProjectNotFound;
//	public List<Project> findAll();
//	public Project update(Project project) throws ProjectNotFound;
//	public Project findById(int id);
	public List<Note> findByProjectId(Integer projectId);

}
