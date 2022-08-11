package com.ultimatracker.services;

import java.util.List;

import com.ultimatracker.entities.Artifact;

public interface ArtifactService {

	public List<Artifact> findAll();

	public List<Artifact> findAllUsersArtifacts(String username);

	public Artifact findById(String username, int artifactId);

	public Artifact addArtifact(String username, Artifact arti);

	public Artifact editArtifact(String username, int artiId, Artifact artifact);

	public List<Artifact> findBySlot(String username, String keyword);

}
