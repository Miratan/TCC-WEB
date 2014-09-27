package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {

	public final static String FIND_BY_USERID_QUERY = "SELECT p FROM Project p LEFT JOIN p.user a WHERE a.userId = :id";

	@Query(FIND_BY_USERID_QUERY)
	public List<Project> findByUserId(@Param("id") Integer userId);

}
