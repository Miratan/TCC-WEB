package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.spr.model.UserProject;

public interface UserProjectRepository extends JpaRepository<UserProject, Integer> {

}
