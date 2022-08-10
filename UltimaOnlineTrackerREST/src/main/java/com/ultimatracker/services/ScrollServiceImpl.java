package com.ultimatracker.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.ultimatracker.entities.Artifact;
import com.ultimatracker.entities.Run;
import com.ultimatracker.entities.Scroll;
import com.ultimatracker.entities.User;
import com.ultimatracker.repositories.ScrollRepository;
import com.ultimatracker.repositories.UserRepository;

public class ScrollServiceImpl implements ScrollService {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private ScrollRepository scrollRepo;

	@Override
	public List<Scroll> findAll() {

		return scrollRepo.findAll();
	}

	@Override
	public List<Scroll> findAllUsersArtifacts(String username) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			List<Run> allRuns = user.getRuns();

			List<Scroll> userScrolls = new ArrayList<>();

			for (Run run : allRuns) {
				userScrolls.addAll(run.getScrolls());

			}
			scrollRepo.saveAllAndFlush(userScrolls);
			return userScrolls;

		}

		return null;
	}

	@Override
	public Scroll findById(String username, int scrollId) {
		User user = userRepo.findByUsername(username);
		if (user != null) {

			Optional<Scroll> scrollOp = scrollRepo.findById(scrollId);
			if (scrollOp.isPresent()) {
				Scroll scroll = scrollOp.get();
				return scroll;

			}
		}

		return null;
	}

	@Override
	public Scroll addScroll(String username, Scroll scroll) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			Scroll newScroll = scroll;
			scrollRepo.saveAndFlush(newScroll);
			return newScroll;
		}

		return null;
	}

	@Override
	public Scroll editScroll(String username, int scrollId, Scroll scroll) {
		User user = userRepo.findByUsername(username);
		if (user != null) {

			Optional<Scroll> scrollOp = scrollRepo.findById(scrollId);
			if (scrollOp.isPresent()) {
				Scroll managed = scrollOp.get();
				
				managed.setName(scroll.getName());
				managed.setValues(scroll.getValues());
				managed.setCategories(scroll.getCategories());
				
				scrollRepo.saveAndFlush(managed);
				return managed;

			}
		}
		
		return null;
	}
	
}
