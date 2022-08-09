package com.ultimatracker.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class ChampSpawn {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String location;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "champ")
	private List<Scroll> scrolls;

	@OneToMany(mappedBy = "champ")
	private List<Artifact> artis;

	public ChampSpawn() {
		super();
	}

	public List<Scroll> getScrolls() {
		return scrolls;
	}

	public void setScrolls(List<Scroll> scrolls) {
		this.scrolls = scrolls;
	}

	public List<Artifact> getArtis() {
		return artis;
	}

	public void setArtis(List<Artifact> artis) {
		this.artis = artis;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
