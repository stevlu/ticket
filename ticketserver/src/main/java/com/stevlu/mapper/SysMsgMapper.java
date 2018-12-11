package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.Hr;
import com.stevlu.bean.MsgContent;
import com.stevlu.bean.SysMsg;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/20.
 */
public interface SysMsgMapper {

	int sendMsg(MsgContent msg);

	int addMsg2AllHr(@Param("hrs") List<Hr> hrs, @Param("mid") Long mid);

	List<SysMsg> getSysMsg(@Param("start") int start, @Param("size") Integer size, @Param("hrid") Long hrid);

	int markRead(@Param("flag") Long flag, @Param("hrid") Long hrid);
}
