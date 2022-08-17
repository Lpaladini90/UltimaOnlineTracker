package com.ultimatracker.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "run_has_scroll")
public class RunScrollsId implements Serializable{

private static final long serialVersionUID = 1L;
	
	@Column(name="run_id")
	private int runId;
	
	@Column(name = "scroll_id")
	private int scrollId;


	
	
	
	public RunScrollsId(int runId, int scrollId) {
		super();
		this.runId = runId;
		this.scrollId = scrollId;
	}

	public RunScrollsId() {
		super();
	}
	
	

	public int getRunId() {
		return runId;
	}

	public void setRunId(int runId) {
		this.runId = runId;
	}

	public int getScrollId() {
		return scrollId;
	}

	public void setScrollId(int scrollId) {
		this.scrollId = scrollId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RunScrollsId [runId=" + runId + ", scrollId=" + scrollId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(runId, scrollId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RunScrollsId other = (RunScrollsId) obj;
		return runId == other.runId && scrollId == other.scrollId;
	}
	
	
	
}
