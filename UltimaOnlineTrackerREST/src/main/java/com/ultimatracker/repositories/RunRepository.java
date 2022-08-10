package com.ultimatracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Run;

public interface RunRepository extends JpaRepository<Run, Integer> {

}
