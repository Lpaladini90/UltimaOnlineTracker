package com.ultimatracker.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Value {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "point_gain")
	private int pointGain;

	@ManyToMany
	@JoinTable(name = "scroll_has_value",
	joinColumns = @JoinColumn(name = "value_id"),
	inverseJoinColumns = @JoinColumn(name = "scroll_id"))
	private List<Scroll> scrolls;

	public Value() {
		super();
	}

	public void addScroll(Scroll scroll) {
		if (scrolls == null) {
			scrolls = new ArrayList<>();

			if (!scrolls.contains(scroll)) {
				scrolls.add(scroll);
				scroll.addValue(this);
			}

		}
		else {
			if (!scrolls.contains(scroll)) {
				scrolls.add(scroll);
				scroll.addValue(this);
			}
		}

	}

	public void removeScroll(Scroll scroll) {

	}

	public List<Scroll> getScrolls() {
		return scrolls;
	}

	public void setScrolls(List<Scroll> scrolls) {
		this.scrolls = scrolls;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPointGain() {
		return pointGain;
	}

	public void setPointGain(int pointGain) {
		this.pointGain = pointGain;
	}

	@Override
	public String toString() {
		return "Value [id=" + id + ", pointGain=" + pointGain + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, pointGain);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Value other = (Value) obj;
		return id == other.id && pointGain == other.pointGain;
	}

}
