package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	public final static String FIND_USER_BY_NAME = "SELECT u FROM User u WHERE u.name like %:name%";
	public final static String FIND_ALL_USERS_WITHOUT_USER_LOGGED = "SELECT u FROM User u WHERE u.userId !=:id ";

	@Query(FIND_USER_BY_NAME)
	public List<User> findByName(@Param("name") String name);
	
	
	@Query(FIND_ALL_USERS_WITHOUT_USER_LOGGED)
	public List<User> findAllWithoutLogged(@Param("id") int id);
	
//	public final static String FIND_PERMISSIONS = "SELECT u FROM User u LEFT JOIN FETCH u.project a LEFT JOIN FETCH p.permission pe WHERE p.projectId = :id AND pe.user.userId = a.userId";
//
//	@Query(FIND_PERMISSIONS)
//	public User findPermissions(@Param("id") Integer userId);

}
