package com.stevlu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stevlu.bean.Affect;
import com.stevlu.bean.Declaration;
import com.stevlu.bean.EmailGroup;
import com.stevlu.bean.Hr;
import com.stevlu.bean.Priority;
import com.stevlu.bean.Questiontype;
import com.stevlu.bean.Server;
import com.stevlu.bean.Source;
import com.stevlu.bean.Subclass;
import com.stevlu.bean.Ticket;
import com.stevlu.mapper.TicketMapper;

import java.util.Date;
import java.util.List;

/**
 * Created by Steven on 2018/10/09.
 */
@Service
@Transactional
public class TicketService {
	@Autowired
	TicketMapper ticketMapper;

	public List<Declaration> getAllDeclarations() {
		return ticketMapper.getAllDeclarations();
	}

	public List<Source> getAllSources() {
		return ticketMapper.getAllSources();
	}

	public List<Priority> getAllPriorities() {
		return ticketMapper.getAllPriorities();
	}

	public List<Server> getAllServers() {
		return ticketMapper.getAllServers();
	}

	public List<Questiontype> getAllQuestiontypes() {
		return ticketMapper.getAllQuestiontypes();
	}

	public List<Subclass> getAllSubclasses(String questiontypeId) {
		return ticketMapper.getAllSubclasses(questiontypeId);
	}

	public List<Affect> getAllAffects() {
		return ticketMapper.getAllAffects();
	}

	public List<Hr> getAllAssignees() {
		return ticketMapper.getAllAssignees();
	}

	public List<Subclass> getChildClass(String questiontypeId) {
		return ticketMapper.getChildClass(questiontypeId);
	}

	public List<EmailGroup> getAllEmailGroups() {
		return ticketMapper.getAllEmailGroups();
	}

	public int addTicket(Ticket ticket) {
		return ticketMapper.addTicket(ticket);
	}

	public List<Ticket> getAllTickets() {
		return ticketMapper.getTicketByPage(null, null, "", null, null, null, null, null, "", null, null);
	}

	public List<Ticket> getTicketByPage(Integer page, Integer size, String keywords, String declarationId,
			String sourceId, String serverId, String affectId, String priorityId, String status, String assigneeId,
			String groupId) {
		int start = (page - 1) * size;
		return ticketMapper.getTicketByPage(start, size, keywords, declarationId, sourceId, serverId, affectId,
				priorityId, status, assigneeId, groupId);
	}

	public Long getCountByKeywords(String keywords, String declarationId, String sourceId, String serverId,
			String affectId, String priorityId, String status, String assigneeId, String groupId) {
		return ticketMapper.getCountByKeywords(keywords, declarationId, sourceId, serverId, affectId, priorityId,
				status, assigneeId, groupId);
	}

	public boolean deleteTicketById(String ids) {
		String[] split = ids.split(",");
		return ticketMapper.deleteTicketById(split) == split.length;
	}

	public int updateTicket(Ticket ticket) {
		return ticketMapper.updateTicket(ticket);
	}

	public int updateAssignee(Ticket ticket) {
		return ticketMapper.updateAssignee(ticket);
	}

	public int sendEmail(Ticket ticket) {
		return ticketMapper.sendEmail(ticket);
	}
}
