package com.ultimatracker.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class ChampSpawn {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String location;
	
	@OneToMany(mappedBy="champspawn")
	private List<Scroll> scrolls;

	@OneToMany(mappedBy="champspawn")
	private Artifact artis;
	
	
	
	public ChampSpawn() {
		super();
	}
	
	

	public List<Scroll> getScrolls() {
		return scrolls;
	}



	public void setScrolls(List<Scroll> scrolls) {
		this.scrolls = scrolls;
	}

	

	public Artifact getArtis() {
		return artis;
	}



	public void setArtis(Artifact artis) {
		this.artis = artis;
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
