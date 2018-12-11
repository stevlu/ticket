package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Role;
import com.stevlu.mapper.RoleMapper;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Service
@Transactional
public class RoleService {
	@Autowired
	RoleMapper roleMapper;

	public List<Role> roles() {
		return roleMapper.roles();
	}

	public int addNewRole(String role, String roleZh) {
		if (!role.startsWith("ROLE_")) {
			role = "ROLE_" + role;
		}
		return roleMapper.addNewRole(role, roleZh);
	}

	public int deleteRoleById(Long rid) {
		return roleMapper.deleteRoleById(rid);
	}
}
