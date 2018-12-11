package com.stevlu.bean;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public class Role {
	private Long id;
	private String name;
	private String nameZh;

	public String getNameZh() {
		return nameZh;
	}

	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
