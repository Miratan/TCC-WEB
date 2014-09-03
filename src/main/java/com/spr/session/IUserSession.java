package com.spr.session;

import java.io.Serializable;

import com.spr.model.User;

public interface IUserSession extends Serializable{
	
	void logarUser(User usuario) throws Exception;
    void logout() throws Exception;
    User getUserLogado() throws Exception;

}
