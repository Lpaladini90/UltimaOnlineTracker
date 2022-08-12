package com.ultimatracker.services;

import java.time.LocalDateTime;
import java.util.List;

import com.ultimatracker.entities.Artifact;
import com.ultimatracker.entities.Run;
import com.ultimatracker.entities.Scroll;

public interface RunService {

	List<Run> indexAllUserRuns(String username);
	
	
	
	Run findById(String username, int runId);
	
	Run addRun(String username, Run run);
	
	Run editRun(String username, Run run, int runId);
	
	Run addScrolls(String username, List<Scroll> scrolls, int runId);
	
	Run addArtifact(String username, List<Artifact> artifacts, int runId);
	
	List<Run> findByDate(String username, LocalDateTime attendedDate);
	
	
	boolean disableRun(String username, Run run, int runId);
	
	
	
}
