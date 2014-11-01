package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.File;

public interface FileRepository extends JpaRepository<File, Integer> {

	public final static String FIND_FILES_BY_PROJECT = "SELECT f FROM File f WHERE f.projectId = :id";
	
	@Query(FIND_FILES_BY_PROJECT)
	public List<File> findByProjectId(@Param("id") Integer projectId);

}
