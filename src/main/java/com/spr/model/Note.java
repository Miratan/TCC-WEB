package com.spr.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class Note implements Serializable{

	private static final long serialVersionUID = -1909274146367580085L;
	
	@Id
	@GeneratedValue
	private Integer noteId;
	
	private String userCreator;
	
	private String dateCreated;
	
	@Column(length=3000)
	private String description;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="projectId")
	private Project project;

	public Integer getNoteId() {
		return noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}
	
	public String getUserCreator() {
		return userCreator;
	}

	public void setUserCreator(String userCreator) {
		this.userCreator = userCreator;
	}

	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
