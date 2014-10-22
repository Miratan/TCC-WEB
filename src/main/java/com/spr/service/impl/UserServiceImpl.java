package com.spr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spr.exception.UserNotFound;
import com.spr.model.User;
import com.spr.repository.UserRepository;
import com.spr.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserRepository userRepository;

	@Override
	@Transactional
	public User create(User user) {
		User createdUser = user;
		return userRepository.save(createdUser);
	}
	
	@Override
	@Transactional
	public User findById(int id) {
		return userRepository.findOne(id);
	}
	
	@Override
	@Transactional(rollbackFor=UserNotFound.class)
	public User delete(int id) throws UserNotFound {
		User deleteUser = userRepository.findOne(id);
		
		if (deleteUser == null)
			throw new UserNotFound();
		
		userRepository.delete(deleteUser);
		return deleteUser;
	}
	
	@Override
	@Transactional
	public List<User> findAll() {
		return userRepository.findAll();
	}
	
	@Override
	public User update(User user) throws UserNotFound {
		User updatedUser = userRepository.findOne(user.getUserId());
		
		if (updatedUser == null)
			throw new UserNotFound();
		
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setBirthday(user.getBirthday());
		updatedUser.setCity(user.getCity());
		updatedUser.setCollege(user.getCollege());
		updatedUser.setCountry(user.getCountry());
		updatedUser.setCourse(user.getCourse());
		updatedUser.setEmail(user.getEmail());
		updatedUser.setName(user.getName());
		updatedUser.setSemester(user.getSemester());
		
		userRepository.saveAndFlush(user);
			
		return updatedUser;
	}

	@Override
	public List<User> findByName(String name) {
		return userRepository.findByName(name);
	}

	@Override
	public List<User> findAllWithoutLogged(int id) {
		return userRepository.findAllWithoutLogged(id);
	}

}
