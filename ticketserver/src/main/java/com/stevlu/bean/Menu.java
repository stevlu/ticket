package com.stevlu.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public class Menu {
	private Long id;
	private String url;
	private String path;
	private Object component;
	private String name;
	private String iconCls;
	private Long parentId;
	private List<Role> roles;
	private List<Menu> children;
	private MenuMeta meta;
	private boolean keepAlive;

	public boolean isKeepAlive() {
		return keepAlive;
	}

	public void setKeepAlive(boolean keepAlive) {
		this.keepAlive = keepAlive;
	}

	public MenuMeta getMeta() {
		return meta;
	}

	public void setMeta(MenuMeta meta) {
		this.meta = meta;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@JsonIgnore
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@JsonFormat(shape = JsonFormat.Shape.OBJECT)
	public Object getComponent() {
		return component;
	}

	public void setComponent(Object component) {
		this.component = component;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	@JsonIgnore
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@JsonIgnore
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
}
