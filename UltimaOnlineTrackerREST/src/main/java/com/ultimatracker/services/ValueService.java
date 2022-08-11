package com.ultimatracker.services;

import java.util.List;

import com.ultimatracker.entities.Value;

public interface ValueService {

	List<Value> findAll();

	List<Value> findAllValues(String username);

	Value findById(String username, int valueId);

	Value addScroll(String username, Value value);

	Value editScroll(String username, int valueId, Value Value);
	
	
}
