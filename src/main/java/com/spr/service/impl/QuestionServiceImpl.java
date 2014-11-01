package com.spr.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.spr.model.Question;
import com.spr.repository.QuestionRepository;
import com.spr.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	private QuestionRepository questionRepository;

	@Override
	public Question create(Question question) {
		return questionRepository.save(question);
	}

}
