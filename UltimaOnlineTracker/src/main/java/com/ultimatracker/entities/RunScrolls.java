package com.ultimatracker.entities;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="run_has_scrolls")
public class RunScrolls {

	@EmbeddedId
	private RunScrollsId id;
	
	
	
	private int quantity;
	
	
	
	
	
}
