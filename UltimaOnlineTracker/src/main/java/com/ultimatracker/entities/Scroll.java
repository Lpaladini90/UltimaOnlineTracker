package com.ultimatracker.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
@Entity
public class Scroll {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@ManyToOne
	@JoinColumn(name="champspawn_id")
	private ChampSpawn champ;
	
	@ManyToMany(mappedBy="scrolls")
	private List<Value> values;
	
	@ManyToMany(mappedBy="scrolls")
	private List<Category> categories;
	

	public Scroll() {
		super();
	}
	
	
	public void addValue(Value value) {
		if(values == null) {
			values = new ArrayList<>();
			if(!values.contains(value)) {
				values.add(value);
				value.addScroll(this);
			}
		}
		else {
			if(!values.contains(value)) {
				values.add(value);
				value.addScroll(this);
			}
		}
		
	}
	
	public void removeValue(Value value) {
		if(values.contains(value)) {
			values.remove(value);
			value.removeScroll(this);
		}
		
	}
	
	public void addCategory(Category category) {
	if(categories == null) {
		categories = new ArrayList<>();
		if(!categories.contains(category)) {
			categories.add(category);
			category.addScroll(this);
		}
	}
	
	else {
		if(!categories.contains(category)) {
			categories.add(category);
			category.addScroll(this);
		}
	}
		
	}
	
	
	
	public void removeCategory(Category category) {
		if(categories.contains(category)) {
			categories.remove(category);
			category.removeScroll(this);
		}
	}
	

	public int getId() {
		return id;
	}
	

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public ChampSpawn getChamp() {
		return champ;
	}

	public void setChamp(ChampSpawn champ) {
		this.champ = champ;
	}

	public List<Value> getValues() {
		return values;
	}

	public void setValues(List<Value> values) {
		this.values = values;
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

	@Override
	public String toString() {
		return "Scroll [id=" + id + ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Scroll other = (Scroll) obj;
		return id == other.id && Objects.equals(name, other.name);
	}
	
	
	
}
