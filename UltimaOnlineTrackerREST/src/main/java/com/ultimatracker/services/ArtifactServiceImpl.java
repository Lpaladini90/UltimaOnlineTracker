package com.ultimatracker.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ultimatracker.entities.Artifact;
import com.ultimatracker.entities.Run;
import com.ultimatracker.entities.User;
import com.ultimatracker.repositories.ArtifactRepository;
import com.ultimatracker.repositories.UserRepository;

@Service
public class ArtifactServiceImpl implements ArtifactService {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private ArtifactRepository artiRepo;

	@Override
	public List<Artifact> findAll() {

		return artiRepo.findAll();
	}

	@Override
	public List<Artifact> findAllUsersArtifacts(String username) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			List<Run> allRuns = user.getRuns();

			List<Artifact> userArtifacts = new ArrayList<>();

			for (Run run : allRuns) {
				userArtifacts.addAll(run.getArtifacts());

			}
			artiRepo.saveAllAndFlush(userArtifacts);
			return userArtifacts;

		}

		return null;
	}

	@Override
	public Artifact findById(String username, int artifactId) {
		User user = userRepo.findByUsername(username);
		if (user != null) {

			Optional<Artifact> artiOp = artiRepo.findById(artifactId);
			if (artiOp.isPresent()) {
				Artifact arti = artiOp.get();
				return arti;

			}
		}

		return null;
	}

	@Override
	public Artifact addArtifact(String username, Artifact arti) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			Artifact newArtifact = arti;
			artiRepo.saveAndFlush(newArtifact);
			return newArtifact;
		}

		return null;
	}

	@Override
	public Artifact editArtifact(String username, int artiId, Artifact artifact) {
		User user = userRepo.findByUsername(username);
		if (user != null) {

			Optional<Artifact> artiOp = artiRepo.findById(artiId);
			if (artiOp.isPresent()) {
				Artifact managed = artiOp.get();
				
				managed.setName(artifact.getName());
				managed.setDescription(artifact.getDescription());
				managed.setQuantity(artiId);
				
				artiRepo.saveAndFlush(managed);
				return managed;

			}
		}
		
		return null;
	}

	@Override
	public List<Artifact> findBySlot(String username, String keyword) {
		
		String search = "%" + keyword + "%";
		
		User user = userRepo.findByUsername(username);
		if(user !=null) {
			List<Artifact> artis = artiRepo.findBySlot(search);
			return artis;
			
		}
		
		return null;
	}

}
