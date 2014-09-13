package com.spr.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class UserProject {
	
	@EmbeddedId
	private UserProjectId id;

	public UserProjectId getId() {
		return id;
	}

	public void setId(UserProjectId id) {
		this.id = id;
	}
	
}
