package com.spr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spr.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	public final static String FIND_USER_BY_NAME = "SELECT u FROM User u WHERE u.nameUser like %:name%";

	@Query(FIND_USER_BY_NAME)
	public List<User> findByName(@Param("name") String name);

}
