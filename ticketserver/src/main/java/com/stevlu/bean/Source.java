package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/18.
 */
public class Source {
	private String source_id;
	private String description;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Source source = (Source) o;

		return description != null ? description.equals(source.description) : source.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Source(String description) {

		this.description = description;
	}

	public Source() {

	}

	public String getSource_id() {
		return source_id;
	}

	public void setSource_id(String source_id) {
		this.source_id = source_id;
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
