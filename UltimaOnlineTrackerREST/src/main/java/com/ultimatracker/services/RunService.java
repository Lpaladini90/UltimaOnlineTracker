package com.ultimatracker.services;

import java.util.List;

import com.ultimatracker.entities.Run;

public interface RunService {

	List<Run> indexAll(String username);
	
	Run findById(String username, int runId);
	
	Run addRun(String username, Run run);
	
	
	Run editRun(String username, Run run, int runId);
	
	boolean disableChampSpawn(String username, Run run, int runId);
	
	
	
}
