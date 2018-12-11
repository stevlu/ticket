package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface MenuRoleMapper {
	int deleteMenuByRid(@Param("rid") Long rid);

	int addMenu(@Param("rid") Long rid, @Param("mids") Long[] mids);
}
