package com.spr.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spr.model.User;
import com.spr.repository.AuthenticationRepository;
import com.spr.service.AuthenticationService;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {

	@Resource
	private AuthenticationRepository authenticationRepository;
	
	@Override
	public User authentication(String username, String password) {
		return authenticationRepository.findAuthenticationUser(username, password);
	}

}
