package com.spr.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spr.exception.UserNotFound;
import com.spr.model.User;
import com.spr.repository.UserRepository;

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
	@Transactional(rollbackFor=UserNotFound.class)
	public User update(User user) throws UserNotFound {
//		User updatedUser = userRepository.findOne(user.getUserId());
//		
//		if (updatedUser == null)
//			throw new UserNotFound();
//		
//		updatedUser.setName(user.getName());
//		updatedUser.setPassword(user.getPassword());
//		updatedUser.setBirthday(user.getBirthday());
//		updatedUser.setCity(user.getCity());
//		updatedUser.setCollege(user.getCollege());
//		updatedUser.setCountry(user.getCountry());
//		updatedUser.setCourse(user.getCourse());
//		updatedUser.setEmail(user.getEmail());
//		updatedUser.setNameUser(user.getNameUser());
//		updatedUser.setSemester(user.getSemester());
		
//		userRepository.save(user);
		
		return userRepository.save(user);
	}

	@Override
	public List<User> findByName(String name) {
		return userRepository.findByName(name);
	}

}
