package com.ultimatracker.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ultimatracker.entities.Run;
import com.ultimatracker.services.RunService;

@RestController
@RequestMapping("api")
@CrossOrigin({ "*", "http://localhost:8094" })
public class RunController {

	@Autowired
	private RunService runServ;

	@GetMapping("runs")
	public List<Run> indexRuns(Principal principal, HttpServletResponse res) {

		List<Run> runs = runServ.indexAllUserRuns(principal.getName());
		try {
			if (runs != null) {
				res.setStatus(200);
				return runs;

			}
		} catch (Exception e) {
			res.setStatus(400);
			e.printStackTrace();
			return null;

		}

		return null;

	}

	// get a run by using the run id
	@GetMapping("runs/{runId}")
	public Run findById(@PathVariable("runId") int runId, Principal principal, HttpServletResponse res) {
		Run run = runServ.findById(principal.getName(), runId);

		try {
			if (run != null) {
				res.setStatus(200);
				return run;

			}
		} catch (Exception e) {
			res.setStatus(400);
			e.printStackTrace();
			return null;
		}

		return null;

	}

	@PostMapping("run")
	public Run createNewRun(@RequestBody Run run, Principal principal, HttpServletResponse res) {

		Run newRun = runServ.addRun(principal.getName(),run);
		
		
		try {
			if (newRun != null) {
				
				res.setStatus(201);
				return newRun;

			}
		} catch (Exception e) {
			res.setStatus(400);
			e.printStackTrace();
		}

		return null;

		

	}

}
