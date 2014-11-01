package com.spr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.spr.model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {
	
}
