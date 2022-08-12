package com.ultimatracker.services;

import java.util.Set;

import com.ultimatracker.entities.User;

public interface UserService {

	User getUserById(int userId);
	
	public Set<User> findUserWithUsernameLike(String keyword);
	
	public User updateUser(User user, String username); 
	
}
