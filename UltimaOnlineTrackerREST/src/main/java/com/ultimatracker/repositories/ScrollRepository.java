package com.ultimatracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.ultimatracker.entities.Scroll;
import com.ultimatracker.entities.Value;

public interface ScrollRepository extends JpaRepository<Scroll, Integer> {

	
//	List<Scroll> findByValues();
	
	List<Scroll> findByValuesLikeOrCategoriesLike(@Param("k")String keyword1, @Param("k")String keyword2);
	
//	List<Scroll> findByCategories_Name(String categoryName);
}
