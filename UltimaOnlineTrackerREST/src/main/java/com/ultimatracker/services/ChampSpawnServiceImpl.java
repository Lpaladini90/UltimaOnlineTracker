package com.ultimatracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ultimatracker.entities.ChampSpawn;
import com.ultimatracker.entities.User;
import com.ultimatracker.repositories.ChampSpawnRepository;
import com.ultimatracker.repositories.UserRepository;

@Service
public class ChampSpawnServiceImpl implements ChampSpawnService {

	@Autowired
	private ChampSpawnRepository champRepo;
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public List<ChampSpawn> indexAll(String username) {

		User user = userRepo.findByUsername(username);
		if (user != null) {
			List<ChampSpawn> spawns = champRepo.findAll();
			if(spawns !=null) {
				return spawns;
				
			}
		}

		return null;
	} 

	@Override
	public ChampSpawn findById(String username, int champId) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			Optional<ChampSpawn> champOP = champRepo.findById(champId);
			if(champOP.isPresent()) {
				ChampSpawn champ = champOP.get();
			return champ;
			}
		}
		return null;
	}

	@Override
	public ChampSpawn createChampSpawn(String username, ChampSpawn champ) {

		User user = userRepo.findByUsername(username);
		if (user != null) {
			ChampSpawn newChamp = new ChampSpawn();
			
			newChamp.setName(champ.getName());
			
		}
		
		return null;
	}

	@Override
	public ChampSpawn editChampSpawn(String username, ChampSpawn champ, int champId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean disableChampSpawn(String username, ChampSpawn champ, int champId) {
		// TODO Auto-generated method stub
		return false;
	}

}
