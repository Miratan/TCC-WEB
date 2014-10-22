package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.spr.model.User;

public interface AuthenticationRepository extends JpaRepository<User, Integer> {
	
	public final static String AUTHENTICATION_USER = "SELECT u FROM User u WHERE u.username =:username AND u.password =:password";

	@Query(AUTHENTICATION_USER)
	public User findAuthenticationUser(@Param("username") String username, @Param("password") String password);

}
