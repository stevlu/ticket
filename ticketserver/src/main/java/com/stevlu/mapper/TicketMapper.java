package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

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

import java.util.List;

/**
 * Created by Steven on 2018/10/09.
 */
public interface TicketMapper {

	List<Declaration> getAllDeclarations();

	List<Source> getAllSources();

	List<Priority> getAllPriorities();

	List<Server> getAllServers();

	List<Questiontype> getAllQuestiontypes();

	List<Subclass> getAllSubclasses(@Param("questiontypeId") String questiontypeId);

	List<Affect> getAllAffects();

	List<Hr> getAllAssignees();

	List<Subclass> getChildClass(@Param("questiontypeId") String questiontypeId);

	List<EmailGroup> getAllEmailGroups();

	int addTicket(@Param("ticket") Ticket ticket);

	List<Ticket> getTicketByPage(@Param("start") Integer start, @Param("size") Integer size,
			@Param("keywords") String keywords, @Param("declarationId") String declarationId,
			@Param("sourceId") String sourceId, @Param("serverId") String serverId, @Param("affectId") String affectId,
			@Param("priorityId") String priorityId, @Param("status") String status,
			@Param("assigneeId") String assigneeId, @Param("groupId") String groupId);

	Long getCountByKeywords(@Param("keywords") String keywords, @Param("declarationId") String declarationId,
			@Param("sourceId") String sourceId, @Param("serverId") String serverId, @Param("affectId") String affectId,
			@Param("priorityId") String priorityId, @Param("status") String status,
			@Param("assigneeId") String assigneeId, @Param("groupId") String groupId);

	int deleteTicketById(@Param("ids") String[] ids);

	int updateTicket(@Param("ticket") Ticket ticket);

	int updateAssignee(@Param("ticket") Ticket ticket);

	int sendEmail(@Param("ticket") Ticket ticket);
}
