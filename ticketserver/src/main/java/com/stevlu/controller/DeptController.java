package com.stevlu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stevlu.bean.Department;
import com.stevlu.service.DepartmentService;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@RestController
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	DepartmentService departmentService;

	@RequestMapping("/deps")
	public List<Department> departments() {
		return departmentService.getAllDeps();
	}
}
