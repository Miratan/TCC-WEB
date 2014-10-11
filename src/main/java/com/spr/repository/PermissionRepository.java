package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spr.model.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Integer> {

//	public final static String FIND_BY_USERID_QUERY = "SELECT p FROM Project p LEFT JOIN p.user a WHERE a.userId = :id";
//
//	@Query(FIND_BY_USERID_QUERY)
//	public List<Project> findByUserId(@Param("id") Integer userId);

}
