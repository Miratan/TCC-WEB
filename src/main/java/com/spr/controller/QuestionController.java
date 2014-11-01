package com.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.spr.model.Question;
import com.spr.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody ModelAndView doQuestion(@ModelAttribute Question question){
		
		questionService.create(question);
		
		ModelAndView mav = new ModelAndView("myProjects");
		mav.setViewName("myProjects");
		return mav;
	}
	
	
}
