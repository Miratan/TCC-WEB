package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.Note;

public interface NoteRepository extends JpaRepository<Note, Integer> {

	public final static String FIND_BY_PROJECTID_QUERY = "SELECT n FROM Note n LEFT JOIN n.project a WHERE a.projectId = :id";
	
	@Query(FIND_BY_PROJECTID_QUERY)
	public List<Note> findByProjectId(@Param("id") Integer projectId);

}
