package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/19.
 */
public class Priority {
	private String priority_id;
	private String description;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Priority priority = (Priority) o;

		return description != null ? description.equals(priority.description) : priority.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Priority(String description) {

		this.description = description;
	}

	public Priority() {

	}

	public String getPriority_id() {
		return priority_id;
	}

	public void setPriority_id(String priority_id) {
		this.priority_id = priority_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getFlag() {
		return flag;
	}

	public void setFlag(Long flag) {
		this.flag = flag;
	}
}
