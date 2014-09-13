package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spr.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {

}
