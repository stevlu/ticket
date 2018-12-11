package com.stevlu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.stevlu.bean.*;
import com.stevlu.common.EmailRunnable;
import com.stevlu.service.TicketService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/**
 * Created by Steven on 2018/10/11.
 */
@RestController
@RequestMapping("/ticket/basic")
public class TicketBasicController {
	@Autowired
	TicketService ticketService;
	@Autowired
	ExecutorService executorService;

	@RequestMapping(value = "/lovdata", method = RequestMethod.GET)
	public Map<String, Object> getAllLOVs(String questiontypeId) {
		Map<String, Object> map = new HashMap<>();
		map.put("declarations", ticketService.getAllDeclarations());
		map.put("sources", ticketService.getAllSources());
		map.put("priorities", ticketService.getAllPriorities());
		map.put("servers", ticketService.getAllServers());
		map.put("questiontypes", ticketService.getAllQuestiontypes());
		map.put("subclasses", ticketService.getAllSubclasses(questiontypeId));
		map.put("affects", ticketService.getAllAffects());
		map.put("assignees", ticketService.getAllAssignees());
		map.put("emailgroups", ticketService.getAllEmailGroups());
		return map;
	}

	@RequestMapping(value = "/tkt", method = RequestMethod.GET)
	public Map<String, Object> getTicketByPage(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "") String keywords,
			String declarationId, String sourceId, String serverId, String affectId, String priorityId, String status,
			String assigneeId, String groupId) {
		Map<String, Object> map = new HashMap<>();
		List<Ticket> ticketByPage = ticketService.getTicketByPage(page, size, keywords, declarationId, sourceId,
				serverId, affectId, priorityId, status, assigneeId, groupId);
		Long count = ticketService.getCountByKeywords(keywords, declarationId, sourceId, serverId, affectId, priorityId,
				status, assigneeId, groupId);
		map.put("tickets", ticketByPage);
		map.put("count", count);
		return map;
	}

	@RequestMapping(value = "/getChildClass", method = RequestMethod.GET)
	public Map<String, Object> getChildClass(String questiontypeId) {
		Map<String, Object> map = new HashMap<>();
		map.put("subclasses", ticketService.getChildClass(questiontypeId));
		return map;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public RespBean updateTicket(Ticket ticket) {
		if (ticketService.updateTicket(ticket) == 1) {
			return new RespBean("success", "修改成功!");
		}
		return new RespBean("error", "修改失败!");
	}

	@RequestMapping(value = "/assign", method = RequestMethod.PUT)
	public RespBean updateAssignee(Ticket ticket) {
		if (ticketService.updateAssignee(ticket) == 1) {
			return new RespBean("success", "修改成功!");
		}
		return new RespBean("error", "修改失败!");
	}

	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public RespBean sendEmail(Ticket ticket) {
		if (ticketService.sendEmail(ticket) == 1) {
			executorService.execute(new EmailRunnable(ticket));
			return new RespBean("success", "发信成功!");
		}
		return new RespBean("error", "添加失败!");
	}
}
