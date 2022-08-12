package com.ultimatracker.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="champspawn")
public class ChampSpawn {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String location;

	@ManyToMany
	@JoinTable(name = "run_has_champspawn", joinColumns = @JoinColumn(name = "run_id"), inverseJoinColumns = @JoinColumn(name = "champspawn_id"))
	private List<Run> runs;

	public ChampSpawn() {
		super();
	}

	public void addRun(Run run) {
		if(runs == null) {
			runs = new ArrayList<>();
			if(!runs.contains(run)){
				runs.add(run);
				run.addChampSpawn(this);
			
			}
		}
		else {
			if(!runs.contains(run)) {
				runs.add(run);
				run.addChampSpawn(this);
			}
		}
		
	}
	
	public void removeRun(Run run) {
		if(runs.contains(run)) {
			runs.remove(run);
			run.removeChampSpawn(this);
		}
		
		
	}
	
	
	
	public List<Run> getRuns() {
		return runs;
	}

	public void setRuns(List<Run> runs) {
		this.runs = runs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "ChampSpawn [id=" + id + ", name=" + name + ", location=" + location + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, location, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChampSpawn other = (ChampSpawn) obj;
		return id == other.id && Objects.equals(location, other.location) && Objects.equals(name, other.name);
	}

}
