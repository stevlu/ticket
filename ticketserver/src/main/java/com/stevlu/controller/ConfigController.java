package com.stevlu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stevlu.bean.Hr;
import com.stevlu.bean.Menu;
import com.stevlu.common.HrUtils;
import com.stevlu.service.MenuService;

import java.util.List;

/**
 * 这是一个只要登录就能访问的Controller 主要用来获取一些配置信息
 */
@RestController
@RequestMapping("/config")
public class ConfigController {
	@Autowired
	MenuService menuService;

	@RequestMapping("/sysmenu")
	public List<Menu> sysmenu() {
		return menuService.getMenusByHrId();
	}

	@RequestMapping("/hr")
	public Hr currentUser() {
		return HrUtils.getCurrentHr();
	}
}
