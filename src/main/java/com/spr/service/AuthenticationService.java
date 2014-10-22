package com.spr.service;

import com.spr.model.User;

public interface AuthenticationService {
	
	public User authentication(String username, String password);

}
