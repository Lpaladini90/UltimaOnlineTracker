package com.ultimatracker.services;

import java.util.List;

import com.ultimatracker.entities.Scroll;
import com.ultimatracker.entities.Value;

public interface ScrollService {

	List<Scroll> findAll();

	List<Scroll> findAllUsersArtifacts(String username);

	Scroll findById(String username, int scrollId);

	Scroll addScroll(String username, Scroll scroll);

	Scroll editScroll(String username, int scrollId, Scroll scroll);
	
	
	
	

}

