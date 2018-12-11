package com.stevlu.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.mapper.MenuRoleMapper;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Service
@Transactional
public class MenuRoleService {
	@Autowired
	MenuRoleMapper menuRoleMapper;

	public int updateMenuRole(Long rid, Long[] mids) {
		menuRoleMapper.deleteMenuByRid(rid);
		if (mids.length == 0) {
			return 0;
		}
		return menuRoleMapper.addMenu(rid, mids);
	}
}
