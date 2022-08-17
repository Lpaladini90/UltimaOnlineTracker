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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Scroll {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	
	@ManyToMany(mappedBy ="scrolls")
	private List<Run> runs;

	
	@JsonIgnore
	@ManyToMany(mappedBy = "scrolls")
	private List<Value> values;

	@JsonIgnore
	@ManyToMany(mappedBy = "scrolls")
	private List<Category> categories;

	public Scroll() {
		super();
	}
	
	public void addRun(Run run) {
		if(runs == null) {
			runs = new ArrayList<>();
			
		if(!runs.contains(run)) {
			runs.add(run);
			run.addScroll(this);
		}
		else {
			runs.add(run);
			run.addScroll(this);
		}
		}
		
	}
	
	public void removeRun(Run run) {
		if(runs.contains(run)) {
			runs.remove(run);
			run.removeScroll(null);
		}
		
	}
	
 
	public void addValue(Value value) {
		if (values == null) {
			values = new ArrayList<>();
			if (!values.contains(value)) {
				values.add(value);
				value.addScroll(this);
			}
		} else {
			if (!values.contains(value)) {
				values.add(value);
				value.addScroll(this);
			}
		}

	}

	public void removeValue(Value value) {
		if (values.contains(value)) {
			values.remove(value);
			value.removeScroll(this);
		}

	}

	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
			if (!categories.contains(category)) {
				categories.add(category);
				category.addScroll(this);
			}
		}

		else {
			if (!categories.contains(category)) {
				categories.add(category);
				category.addScroll(this);
			}
		}

	}

	public void removeCategory(Category category) {
		if (categories.contains(category)) {
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
		return "Scroll [id=" + id + ", name=" + name + ", values=" + values + ", categories=" + categories + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(categories, id, name, values);
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
		return Objects.equals(categories, other.categories) && id == other.id && Objects.equals(name, other.name)
				&& Objects.equals(values, other.values);
	}

}
