package com.stevlu.bean;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public class MenuMeta {

	private boolean keepAlive;
	private boolean requireAuth;

	public boolean isKeepAlive() {
		return keepAlive;
	}

	public void setKeepAlive(boolean keepAlive) {
		this.keepAlive = keepAlive;
	}

	public boolean isRequireAuth() {
		return requireAuth;
	}

	public void setRequireAuth(boolean requireAuth) {
		this.requireAuth = requireAuth;
	}
}
