package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {

	public final static String FIND_BY_USERID_QUERY = "SELECT p FROM Project p LEFT JOIN FETCH p.user a WHERE a.userId = :id";

	@Query(FIND_BY_USERID_QUERY)
	public List<Project> findByUserId(@Param("id") Integer userId);
	
//	public final static String FIND_PROJECT_BY_USERID_QUERY = "SELECT p FROM Project p LEFT JOIN FETCH p.user a LEFT JOIN FETCH p.permission pe WHERE p.projectId = :id AND pe.user.userId = :idUser ";
//
//	@Query(FIND_PROJECT_BY_USERID_QUERY)
//	public Project findProject(@Param("id") Integer projectId, @Param("idUser") Integer userId);


}
