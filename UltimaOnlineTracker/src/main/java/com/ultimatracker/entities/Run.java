package com.ultimatracker.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Run {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private boolean solo;
	
	private boolean raided;
	
	private int deaths;
	
	@Column(name="date_attended")
	private LocalDateTime attendedDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "run")
	private List<Scroll> scrolls;

	@OneToMany(mappedBy = "run")
	private List<Artifact> artis;
	
	@ManyToMany(mappedBy="runs")
	private List<ChampSpawn> champs;
	
	
	
	public Run() {
		super();
	}

	public void addChampSpawn(ChampSpawn champ) {
		if(champs == null) {
			champs = new ArrayList<>();
			if(!champs.contains(champ)) {
				champs.add(champ);
				champ.addRun(this);
			}
		}
		
		else {
			if(!champs.contains(champ)) {
				champs.add(champ);
				champ.addRun(this);
			}
		}
	}
	
	public void removeChampSpawn(ChampSpawn champ) {
		
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public boolean isSolo() {
		return solo;
	}



	public void setSolo(boolean solo) {
		this.solo = solo;
	}



	public boolean isRaided() {
		return raided;
	}



	public void setRaided(boolean raided) {
		this.raided = raided;
	}



	public int getDeaths() {
		return deaths;
	}



	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}



	public LocalDateTime getAttendedDate() {
		return attendedDate;
	}



	public void setAttendedDate(LocalDateTime attendedDate) {
		this.attendedDate = attendedDate;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
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



	public List<ChampSpawn> getChamps() {
		return champs;
	}



	public void setChamps(List<ChampSpawn> champs) {
		this.champs = champs;
	}



	@Override
	public int hashCode() {
		return Objects.hash(artis, attendedDate, champs, deaths, id, raided, scrolls, solo, user);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Run other = (Run) obj;
		return Objects.equals(artis, other.artis) && Objects.equals(attendedDate, other.attendedDate)
				&& Objects.equals(champs, other.champs) && deaths == other.deaths && id == other.id
				&& raided == other.raided && Objects.equals(scrolls, other.scrolls) && solo == other.solo
				&& Objects.equals(user, other.user);
	}



	@Override
	public String toString() {
		return "Run [id=" + id + ", solo=" + solo + ", raided=" + raided + ", deaths=" + deaths + ", attendedDate="
				+ attendedDate + ", user=" + user + ", scrolls=" + scrolls + ", artis=" + artis + ", champs=" + champs
				+ "]";
	}

	


}