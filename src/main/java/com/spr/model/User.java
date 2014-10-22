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
import org.hibernate.validator.constraints.Length;

@Entity
@Table
public class User implements Serializable {

	private static final long serialVersionUID = 141336660916089935L;

	@Id
	@GeneratedValue
	private Integer userId;

	@Length(max = 40)
	private String username;

	@Length(max = 10)
	private String password;

	@Length(max = 40)
	private String name;

	@Length(max = 40)
	private String city;

	private Date birthday;

	@Length(max = 40)
	private String country;

	@Length(max = 40)
	private String email;

	@Length(max = 40)
	private String college;

	@Length(max = 40)
	private String course;

	@Length(max = 10)
	private String semester;

	@OneToMany(fetch = FetchType.EAGER)
	@Cascade({ CascadeType.SAVE_UPDATE })
	private List<Project> project;

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, targetEntity = Permission.class)
	private List<Permission> permission;

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

}
