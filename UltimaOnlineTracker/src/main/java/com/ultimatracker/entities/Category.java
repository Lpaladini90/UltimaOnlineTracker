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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;


	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "scroll_has_category", joinColumns = @JoinColumn(name = "category_id"), inverseJoinColumns = @JoinColumn(name = "scroll_id"))
	private List<Scroll> scrolls;

	public Category() {
		super();
	}

	public void addScroll(Scroll scroll) {
		if (scrolls == null) {
			scrolls = new ArrayList<>();
			if (!scrolls.contains(scroll)) {
				scrolls.add(scroll);
				scroll.addCategory(this);

			}

		} else {
			if (!scrolls.contains(scroll)) {
				scrolls.add(scroll);
				scroll.addCategory(this);

			}
		}

	}

	public void removeScroll(Scroll scroll) {
		if(scrolls.contains(scroll)) {
			scrolls.remove(scroll);
			scroll.removeCategory(this);
		}
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

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
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
		Category other = (Category) obj;
		return id == other.id && Objects.equals(name, other.name);
	}

}
