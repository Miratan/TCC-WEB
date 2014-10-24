package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Integer> {

//	public final static String FIND_PROJECT_BY_USERID_QUERY = "SELECT p FROM Permission p LEFT JOIN FETCH p.user a LEFT JOIN FETCH p.project pe WHERE p.projectId = :id AND p.userId = :idUser ";
	public final static String FIND_PROJECT_BY_USERID_QUERY = "SELECT p FROM Permission p LEFT JOIN FETCH p.user a LEFT JOIN FETCH p.project pe WHERE a.userId = :idUser AND pe.projectId = :id ";
	public final static String FIND_PROJECT_PERMISSION = "SELECT p FROM Permission p LEFT JOIN FETCH p.project pe WHERE pe.projectId = :id ";

	@Query(FIND_PROJECT_BY_USERID_QUERY)
	public Permission findPermission(@Param("id") Integer id, @Param("idUser") Integer userId);
	
	@Query(FIND_PROJECT_PERMISSION)
	public Permission findProjectPermission(@Param("id") Integer id);

}
