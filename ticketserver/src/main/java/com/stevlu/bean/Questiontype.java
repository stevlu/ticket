package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/22.
 */
public class Questiontype {
	private String question_id;
	private String description;
	private Long orderno;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Questiontype questiontype = (Questiontype) o;

		return description != null ? description.equals(questiontype.description) : questiontype.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Questiontype(String description) {

		this.description = description;
	}

	public Questiontype() {

	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getOrderno() {
		return orderno;
	}

	public void setOrderno(Long orderno) {
		this.orderno = orderno;
	}

	public Long getFlag() {
		return flag;
	}

	public void setFlag(Long flag) {
		this.flag = flag;
	}
}