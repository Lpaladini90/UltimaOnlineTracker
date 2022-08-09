package com.ultimatracker.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Artifact {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	private int quantity;

	@ManyToOne
	@JoinColumn(name="artifact_id")
	private ChampSpawn champ;
	
	
	
	public Artifact() {
		super();
	}
	
	

	public ChampSpawn getChamp() {
		return champ;
	}



	public void setChamp(ChampSpawn champ) {
		this.champ = champ;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Artifact [id=" + id + ", name=" + name + ", description=" + description + ", quantity=" + quantity
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, id, name, quantity);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Artifact other = (Artifact) obj;
		return Objects.equals(description, other.description) && id == other.id && Objects.equals(name, other.name)
				&& quantity == other.quantity;
	}
	
	
	
	
}
	
