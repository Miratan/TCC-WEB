package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spr.model.File;

public interface FileRepository extends JpaRepository<File, Integer> {

}
