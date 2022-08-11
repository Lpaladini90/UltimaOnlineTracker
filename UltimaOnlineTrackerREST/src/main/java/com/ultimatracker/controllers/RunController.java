package com.ultimatracker.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
	public List<Run> indexRuns(Principal principle, HttpServletRequest res) {

		return runServ.indexAllUserRuns(principle.getName());
	}
	
	

}
