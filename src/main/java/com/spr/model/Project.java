package com.spr.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "project")
public class Project implements Serializable {

	private static final long serialVersionUID = -4091038843674636286L;

	@Id
	@Column(name = "PROJECT_ID")
	@GeneratedValue
	private Integer id;
	private String title;
	private String description;
	private String keyWords;
	private String discipline;
	private Date deliveryDate;

	@OneToMany(mappedBy = "id.project")
	private Collection<UserProject> userProjectList;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public String getDiscipline() {
		return discipline;
	}

	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public Collection<UserProject> getUserProjectList() {
		return userProjectList;
	}

	public void setUserProjectList(Collection<UserProject> userProjectList) {
		this.userProjectList = userProjectList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((deliveryDate == null) ? 0 : deliveryDate.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result
				+ ((discipline == null) ? 0 : discipline.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((keyWords == null) ? 0 : keyWords.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result
				+ ((userProjectList == null) ? 0 : userProjectList.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Project other = (Project) obj;
		if (deliveryDate == null) {
			if (other.deliveryDate != null)
				return false;
		} else if (!deliveryDate.equals(other.deliveryDate))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (discipline == null) {
			if (other.discipline != null)
				return false;
		} else if (!discipline.equals(other.discipline))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (keyWords == null) {
			if (other.keyWords != null)
				return false;
		} else if (!keyWords.equals(other.keyWords))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (userProjectList == null) {
			if (other.userProjectList != null)
				return false;
		} else if (!userProjectList.equals(other.userProjectList))
			return false;
		return true;
	}

}
