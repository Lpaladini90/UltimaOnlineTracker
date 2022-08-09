package com.ultimatracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Artifact;

public interface ArtifactRepository extends JpaRepository<Artifact, Integer> {

}