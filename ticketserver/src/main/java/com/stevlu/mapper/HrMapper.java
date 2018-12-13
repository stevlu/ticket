package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.Hr;
import com.stevlu.bean.Role;

import java.util.List;

/**
 * Created by Steven Lu on 2018/10/30.
 */
public interface HrMapper {
	Hr loadUserByUsername(String username);

	List<Role> getRolesByHrId(Long id);

	int hrReg(@Param("username") String username, @Param("password") String password);

	List<Hr> getHrsByKeywords(@Param("keywords") String keywords);

	int updateHr(Hr hr);

	int updateHrDept(Hr hr);
	
	int updateHrPhone(Hr hr);
	
	int updateHrEmail(Hr hr);
	
	int updateHrUsername(Hr hr);
	
	int updateHrName(Hr hr);

	int deleteRoleByHrId(Long hrId);

	int addRolesForHr(@Param("hrId") Long hrId, @Param("rids") Long[] rids);

	Hr getHrById(Long hrId);

	int deleteHr(Long hrId);

	List<Hr> getAllHr(@Param("currentId") Long currentId);
}
