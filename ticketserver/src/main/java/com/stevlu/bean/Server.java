package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/22.
 */
public class Server {
	private String server_id;
	private String description;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Server server = (Server) o;

		return description != null ? description.equals(server.description) : server.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Server(String description) {

		this.description = description;
	}

	public Server() {

	}

	public String getServer_id() {
		return server_id;
	}

	public void setServer_id(String server_id) {
		this.server_id = server_id;
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