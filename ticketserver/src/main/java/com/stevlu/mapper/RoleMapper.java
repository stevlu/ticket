package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.Role;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface RoleMapper {
	List<Role> roles();

	int addNewRole(@Param("role") String role, @Param("roleZh") String roleZh);

	int deleteRoleById(Long rid);
}
