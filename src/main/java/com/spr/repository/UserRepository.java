package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spr.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
