package com.spr.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spr.model.Note;
import com.spr.repository.NoteRepository;
import com.spr.session.UserSession;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Resource
	private NoteRepository noteRepository;
	
	@Autowired
	private UserSession userSession;
	
	@Autowired
	private UserService userService;

	@Override
	public Note create(Note note) {
		note.setUserCreator(userSession.getUserLogado().getNameUser());
		return noteRepository.save(note);
	}

	@Override
	public List<Note> findByProjectId(Integer projectId) {
		return noteRepository.findByProjectId(projectId);
	}

//	@Override
//	@Transactional
//	public Project create(Project project){
//		Project createdProject = project;
//		createdProject.setUser(userService.findById(userSession.getUserLogado().getUserId()));
//		projectRepository.save(createdProject);
//		return createdProject;
//	}

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
