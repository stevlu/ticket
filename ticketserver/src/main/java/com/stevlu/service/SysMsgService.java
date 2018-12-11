package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Hr;
import com.stevlu.bean.MsgContent;
import com.stevlu.bean.SysMsg;
import com.stevlu.common.HrUtils;
import com.stevlu.mapper.SysMsgMapper;

import java.util.List;

/**
 * Created by Steven Lu on 2018/10/31.
 */
@Service
@Transactional
public class SysMsgService {
	@Autowired
	SysMsgMapper sysMsgMapper;
	@Autowired
	HrService hrService;

	@PreAuthorize("hasRole('ROLE_admin')") // 只有管理员可以发送系统消息
	public boolean sendMsg(MsgContent msg) {
		int result = sysMsgMapper.sendMsg(msg);
		if (result == 1) {
			List<Hr> allHr = hrService.getAllHr();
			int result2 = sysMsgMapper.addMsg2AllHr(allHr, msg.getId());
			return result2 == allHr.size();
		}
		return false;
	}

	public List<SysMsg> getSysMsgByPage(Integer page, Integer size) {
		int start = (page - 1) * size;
		return sysMsgMapper.getSysMsg(start, size, HrUtils.getCurrentHr().getId());
	}

	public boolean markRead(Long flag) {
		if (flag != -1) {
			return sysMsgMapper.markRead(flag, HrUtils.getCurrentHr().getId()) == 1;
		}
		sysMsgMapper.markRead(flag, HrUtils.getCurrentHr().getId());
		return true;
	}
}
