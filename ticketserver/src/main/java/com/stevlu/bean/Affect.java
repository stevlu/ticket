package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/22.
 */
public class Affect {
	private String affect_id;
	private String description;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Affect affect = (Affect) o;

		return description != null ? description.equals(affect.description) : affect.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Affect(String description) {

		this.description = description;
	}

	public Affect() {

	}

	public String getAffect_id() {
		return affect_id;
	}

	public void setAffect_id(String affect_id) {
		this.affect_id = affect_id;
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