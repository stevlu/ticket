package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Department;
import com.stevlu.mapper.DepartmentMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Steven Lu on 2018/10/30.
 */
@Service
@Transactional
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;

	public int addDep(Department department) {
		department.setEnabled(1);
		departmentMapper.addDep(department);
		return department.getResult();
	}

	public int deleteDep(Long did) {
		Department department = new Department();
		department.setId(did);
		departmentMapper.deleteDep(department);
		return department.getResult();
	}

	public List<Department> getDepByPid(Long pid) {
		return departmentMapper.getDepByPid(pid);
	}

	public List<Department> getAllDeps() {
		return departmentMapper.getAllDeps();
	}
}
