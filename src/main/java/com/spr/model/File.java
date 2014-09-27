package com.spr.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "file")
public class File implements Serializable {

	private static final long serialVersionUID = 141336660916089935L;

	@Id
	@Column(name = "FILE_ID")
	@GeneratedValue
	private Integer id;
	
	private String description;
	
	@Lob
    @Column(name="ARCHIVE", nullable=false, columnDefinition="mediumblob")
    private byte[] file;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}
	
}
