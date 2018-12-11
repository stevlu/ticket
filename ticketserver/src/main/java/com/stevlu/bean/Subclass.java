package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/22.
 */
public class Subclass {
	private String subclass_id;
	private String questionid;
	private String description;
	private Long orderno;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Subclass subclass = (Subclass) o;

		return description != null ? description.equals(subclass.description) : subclass.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Subclass(String description) {

		this.description = description;
	}

	public Subclass() {

	}

	public String getSubclass_id() {
		return subclass_id;
	}

	public void setSubclass_id(String subclass_id) {
		this.subclass_id = subclass_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQuestionid() {
		return questionid;
	}

	public void setQuestionid(String questionid) {
		this.questionid = questionid;
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