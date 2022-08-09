package com.ultimatracker.services;

import com.ultimatracker.entities.User;

public interface AuthService {

	public User register(User user);
	public User getUserByUsername(String username);
	
}
