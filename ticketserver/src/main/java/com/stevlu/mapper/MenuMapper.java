package com.stevlu.mapper;

import java.util.List;

import com.stevlu.bean.Menu;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface MenuMapper {
	List<Menu> getAllMenu();

	List<Menu> getMenusByHrId(Long hrId);

	List<Menu> menuTree();

	List<Long> getMenusByRid(Long rid);
}
