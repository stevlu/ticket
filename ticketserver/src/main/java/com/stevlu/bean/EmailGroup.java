package com.stevlu.bean;

/**
 * Created by Steven on 2018/11/06.
 */
public class EmailGroup {
	private String group_id;
	private String description;
	private String email;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		EmailGroup emailgroup = (EmailGroup) o;

		return description != null ? description.equals(emailgroup.description) : emailgroup.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public EmailGroup(String description) {

		this.description = description;
	}

	public EmailGroup() {

	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getFlag() {
		return flag;
	}

	public void setFlag(Long flag) {
		this.flag = flag;
	}
}
