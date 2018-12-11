package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Menu;
import com.stevlu.common.HrUtils;
import com.stevlu.mapper.MenuMapper;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Service
@Transactional
public class MenuService {
	@Autowired
	MenuMapper menuMapper;

	public List<Menu> getAllMenu() {
		return menuMapper.getAllMenu();
	}

	public List<Menu> getMenusByHrId() {
		return menuMapper.getMenusByHrId(HrUtils.getCurrentHr().getId());
	}

	public List<Menu> menuTree() {
		return menuMapper.menuTree();
	}

	public List<Long> getMenusByRid(Long rid) {
		return menuMapper.getMenusByRid(rid);
	}
}
