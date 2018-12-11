package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.Position;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface PositionMapper {

	int addPos(@Param("pos") Position pos);

	Position getPosByName(String name);

	List<Position> getAllPos();

	int deletePosById(@Param("pids") String[] pids);

	int updatePosById(@Param("pos") Position position);
}
