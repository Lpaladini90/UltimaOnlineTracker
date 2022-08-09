package com.ultimatracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ultimatracker.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
