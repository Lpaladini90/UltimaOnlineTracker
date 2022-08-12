package com.ultimatracker.repositories;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Run;

public interface RunRepository extends JpaRepository<Run, Integer> {

	public List<Run> findByAttendedDateLike(LocalDateTime attendedDate);
	
	public List<Run> findBySoloLike( boolean solo);

	public List<Run> findByUser_Username(String username);
	
	
}
