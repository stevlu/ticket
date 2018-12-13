package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Hr;
import com.stevlu.common.HrUtils;
import com.stevlu.mapper.HrMapper;

import java.util.List;

/**
 * Created by Steven Lu on 2018/10/30.
 */
@Service
@Transactional
public class HrService implements UserDetailsService {

	@Autowired
	HrMapper hrMapper;

	@Override
	public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
		Hr hr = hrMapper.loadUserByUsername(s);
		if (hr == null) {
			throw new UsernameNotFoundException("用户名不对");
		}
		return hr;
	}

	public int hrReg(String username, String password) {
		// 如果用户名存在，返回错误
		if (hrMapper.loadUserByUsername(username) != null) {
			return -1;
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encode = encoder.encode(password);
		return hrMapper.hrReg(username, encode);
	}

	public List<Hr> getHrsByKeywords(String keywords) {
		return hrMapper.getHrsByKeywords(keywords);
	}

	public int updateHr(Hr hr) {
		return hrMapper.updateHr(hr);
	}

	public int updateHrDept(Hr hr) {
		return hrMapper.updateHrDept(hr);
	}
	
	public int updateHrPhone(Hr hr) {
		return hrMapper.updateHrPhone(hr);
	}
	
	public int updateHrEmail(Hr hr) {
		return hrMapper.updateHrEmail(hr);
	}
	
	public int updateHrUsername(Hr hr) {
		return hrMapper.updateHrUsername(hr);
	}
	
	public int updateHrName(Hr hr) {
		return hrMapper.updateHrName(hr);
	}

	public int updateHrRoles(Long hrId, Long[] rids) {
		int i = hrMapper.deleteRoleByHrId(hrId);
		return hrMapper.addRolesForHr(hrId, rids);
	}

	public Hr getHrById(Long hrId) {
		return hrMapper.getHrById(hrId);
	}

	public int deleteHr(Long hrId) {
		return hrMapper.deleteHr(hrId);
	}

	public List<Hr> getAllHrExceptAdmin() {
		return hrMapper.getAllHr(HrUtils.getCurrentHr().getId());
	}

	public List<Hr> getAllHr() {
		return hrMapper.getAllHr(null);
	}
}
