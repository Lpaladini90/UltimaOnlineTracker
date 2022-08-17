package com.ultimatracker.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ultimatracker.entities.Artifact;
import com.ultimatracker.entities.Run;
import com.ultimatracker.entities.Scroll;
import com.ultimatracker.entities.User;
import com.ultimatracker.repositories.RunRepository;
import com.ultimatracker.repositories.UserRepository;

@Service
public class RunServiceImpl implements RunService {

	@Autowired
	private RunRepository runRepo;

	@Autowired
	private UserRepository userRepo;

	@Override
	public List<Run> indexAllUserRuns(String username) {
		System.out.println("iniside run impl");
		System.out.println(username);
		return runRepo.findByUser_Username(username);

	}

	@Override
	public Run findById(String username, int runId) {

		User user = userRepo.findByUsername(username);

		if (user != null) {

			Optional<Run> runOp = runRepo.findById(runId);
			if (runOp.isPresent()) {

				Run run = runOp.get();
				if (run.getUser().getUsername() == user.getUsername()) {
					return run;
				}
			}
		}

		return null;
	}

	@Override
	public Run addRun(String username, Run run) {
		User user = userRepo.findByUsername(username);

		if (user != null) {
			Run newRun = run;
			newRun.setUser(user);
			addScrolls(username, null, 0);
			addArtifact(username, null, 0);
			
			runRepo.saveAndFlush(newRun);
			
		
			
			
			
			return newRun;

		}

		return null;
	}

	@Override
	public Run editRun(String username, Run run, int runId) {

		User user = userRepo.findByUsername(username);

		if (user != null) {
			Optional<Run> runOp = runRepo.findById(runId);
			if (runOp.isPresent()) {
				Run modified = runOp.get();
				modified.setUser(run.getUser());
				modified.setArtifacts(run.getArtifacts());
				modified.setAttendedDate(run.getAttendedDate());
				modified.setChamps(run.getChamps());
				modified.setDeaths(run.getDeaths());
				modified.setRaided(run.isRaided());
				modified.setScrolls(run.getScrolls());
				modified.setSolo(run.isSolo());

				runRepo.saveAndFlush(modified);

				return modified;
			}

		}

		return null;
	}

	@Override
	public Run addScrolls(String username, List<Scroll> scrolls, int runId) {
		User user = userRepo.findByUsername(username);

		if (user != null) {
			Optional<Run> runOp = runRepo.findById(runId);
			if (runOp.isPresent()) {
				Run run = runOp.get();
				if (run.getUser().getUsername() == username) {
					run.setScrolls(scrolls);
					runRepo.saveAndFlush(run);
					return run;

				}

			}
		}

		return null;
	}

	@Override
	public Run addArtifact(String username, List<Artifact> artifacts, int runId) {
		User user = userRepo.findByUsername(username);

		if (user != null) {
			Optional<Run> runOp = runRepo.findById(runId);
			if (runOp.isPresent()) {
				Run run = runOp.get();
				if (run.getUser().getUsername() == username) {
					run.setArtifacts(artifacts);
					runRepo.saveAndFlush(run);
					return run;

				}

			}
		}

		return null;
	}

	@Override
	public List<Run> findByDate(String username, LocalDateTime attendedDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean disableRun(String username, Run run, int runId) {
		// TODO Auto-generated method stub
		return false;
	}

}
