package com.ultimatracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Value;

public interface ValueRepository extends JpaRepository<Value, Integer> {

}
