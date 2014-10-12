package com.spr.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table
public class User implements Serializable {

	private static final long serialVersionUID = 141336660916089935L;

	@Id
	@GeneratedValue
	private Integer userId;
	
	private String name;
	private String password;
	private String nameUser;
	private String city;
	private Date birthday;
	private String country;
	private String email;
	private String college;
	private String course;
	private String semester;

	@OneToMany(fetch = FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE})
	private List<Project> project;
	
//	@JsonIgnore
//	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, targetEntity = Permission.class)
//	@Cascade({CascadeType.SAVE_UPDATE})
//	private List<Permission> permission;
	
	@Column(columnDefinition = "int(2) DEFAULT 0", insertable = false, updatable = true)
	private Integer version;

	public List<Project> getProject() {
		return project;
	}

	public void setProject(List<Project> project) {
		this.project = project;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}
	
	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
	
//	public List<Permission> getPermission() {
//		return permission;
//	}
//
//	public void setPermission(List<Permission> permission) {
//		this.permission = permission;
//	}

}
