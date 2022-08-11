package com.ultimatracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Artifact;

public interface ArtifactRepository extends JpaRepository<Artifact, Integer> {

	List<Artifact> findBySlot(String slot);
	
	
}