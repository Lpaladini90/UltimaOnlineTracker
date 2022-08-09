package com.ultimatracker.services;

import java.util.List;

import com.ultimatracker.entities.ChampSpawn;

public interface ChampSpawnService {

	List<ChampSpawn> indexAll(String username);
	
	ChampSpawn findById(String username, int champId);
	
	ChampSpawn createChampSpawn(String username, ChampSpawn champ);
	
	ChampSpawn editChampSpawn(String username, ChampSpawn champ, int champId);
	
	boolean disableChampSpawn(String username, ChampSpawn champ, int champId);
	
	
}
