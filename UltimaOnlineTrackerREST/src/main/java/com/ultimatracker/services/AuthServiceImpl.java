//package com.ultimatracker.services;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import com.ultimatracker.entities.User;
//import com.ultimatracker.repositories.UserRepository;
//
//@Service
//public class AuthServiceImpl implements AuthService {
//	@Autowired
//	private PasswordEncoder encoder;
//
//	@Autowired
//	private UserRepository userRepo;
//
//	
//	@Override
//	public User register(User user) {
//		user.setPassword(encoder.encode(user.getPassword()));
//		user.setActive(true);
//		user.setRole("standard");
//		
//		userRepo.saveAndFlush(user);
//		
//		return user;
//	}
//
//	@Override
//	public User getUserByUsername(String username) {
//		
//		System.out.println("This is get user username: " + username);
//		return userRepo.findByUsername(username);
//	}
//
//}
