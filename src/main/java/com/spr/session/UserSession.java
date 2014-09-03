package com.spr.session;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.spr.model.User;

@Service
public class UserSession implements IUserSession {

	private static final long serialVersionUID = -5607260388060426955L;
	private static final String KEY_SESSION_USER = "usuario.session";
    
	@Override
	public void logarUser(User user) throws Exception {
		if (getUserLogado() == null) {
			RequestContextHolder.getRequestAttributes().setAttribute(
					UserSession.KEY_SESSION_USER, user,
					RequestAttributes.SCOPE_SESSION);
		} else {
			throw new Exception("Já existe um usuário logado nesta session.");
		}
	}

	@Override
	public void logout() throws Exception {
		if (getUserLogado() != null) {
			RequestContextHolder.getRequestAttributes().removeAttribute(
					UserSession.KEY_SESSION_USER,
					RequestAttributes.SCOPE_SESSION);
		} else {
			throw new Exception("Já existe um usuário logado nesta session.");
		}
	}

	@Override
	public User getUserLogado() {
		try {
			return (User) RequestContextHolder.getRequestAttributes()
					.getAttribute(UserSession.KEY_SESSION_USER,
							RequestAttributes.SCOPE_SESSION);
		} catch (Exception e) {
			return null;
		}
	}

	
}
