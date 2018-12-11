package com.stevlu.bean;

/**
 * Created by Steven on 2018/10/11.
 */
public class Declaration {
	private String declaration_id;
	private String description;
	private Long flag;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Declaration declaration = (Declaration) o;

		return description != null ? description.equals(declaration.description) : declaration.description == null;
	}

	@Override
	public int hashCode() {
		return description != null ? description.hashCode() : 0;
	}

	public Declaration(String description) {

		this.description = description;
	}

	public Declaration() {

	}

	public String getDeclaration_id() {
		return declaration_id;
	}

	public void setDeclaration_id(String declaration_id) {
		this.declaration_id = declaration_id;
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
