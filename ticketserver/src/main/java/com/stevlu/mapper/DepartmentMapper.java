package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.Department;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface DepartmentMapper {
	void addDep(@Param("dep") Department department);

	void deleteDep(@Param("dep") Department department);

	List<Department> getDepByPid(Long pid);

	List<Department> getAllDeps();
}
