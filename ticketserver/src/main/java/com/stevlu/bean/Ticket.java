package com.stevlu.bean;

import java.sql.Timestamp;

/**
 * Created by Steven on 2018/10/09.
 */
public class Ticket {

	private String logId;
	private String title;
	private String describe;
	private String describehis;
	private Timestamp createdDate;
	private String emailCreatedDate;
	private String customerName;
	private String customerId;
	private String mobile;
	private String tel;
	private String email;
	private String gemail;
	private String status;
	private String vipId;
	private String vipdesc;
	private String declarationId;
	private String sourceId;
	private String priorityId;
	private String serverId;
	private String questiontypeId;
	private String subclassId;
	private String affectId;
	private String assigneeId;
	private String groupId;
	private Declaration declaration;
	private Source source;
	private Priority priority;
	private Server server;
	private Questiontype questiontype;
	private Subclass subclass;
	private Affect affect;
	private Hr hr;
	private EmailGroup emailgroup;

	public Ticket() {
	}

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getDescribehis() {
		return describehis;
	}

	public void setDescribehis(String describehis) {
		this.describehis = describehis;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public String getEmailCreatedDate() {
		return emailCreatedDate;
	}

	public void setEmailCreatedDate(String emailCreatedDate) {
		this.emailCreatedDate = emailCreatedDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGemail() {
		return gemail;
	}

	public void setGemail(String gemail) {
		this.gemail = gemail;
	}

	public String getVipId() {
		return vipId;
	}

	public void setVipId(String vipId) {
		this.vipId = vipId;
	}

	public String getVipdesc() {
		return vipdesc;
	}

	public void setVipdesc(String vipdesc) {
		this.vipdesc = vipdesc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeclarationId() {
		return declarationId;
	}

	public void setDeclarationId(String declarationId) {
		this.declarationId = declarationId;
	}

	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	public String getServerId() {
		return serverId;
	}

	public void setQuestiontypeId(String questiontypeId) {
		this.questiontypeId = questiontypeId;
	}

	public String getQuestiontypeId() {
		return questiontypeId;
	}

	public void setSubclassId(String subclassId) {
		this.subclassId = subclassId;
	}

	public String getSubclassId() {
		return subclassId;
	}

	public void setPriorityId(String priorityId) {
		this.priorityId = priorityId;
	}

	public String getPriorityId() {
		return priorityId;
	}

	public void setAffectId(String affectId) {
		this.affectId = affectId;
	}

	public String getAffectId() {
		return affectId;
	}

	public void setAssigneeId(String assigneeId) {
		this.assigneeId = assigneeId;
	}

	public String getAssigneeId() {
		return assigneeId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Declaration getDeclaration() {
		return declaration;
	}

	public void setDeclaration(Declaration declaration) {
		this.declaration = declaration;
	}

	public Source getSource() {
		return source;
	}

	public void setSource(Source source) {
		this.source = source;
	}

	public Priority getPriority() {
		return priority;
	}

	public void setPriority(Priority priority) {
		this.priority = priority;
	}

	public Server getServer() {
		return server;
	}

	public void setServer(Server server) {
		this.server = server;
	}

	public Questiontype getQuestiontype() {
		return questiontype;
	}

	public void setQuestiontype(Questiontype questiontype) {
		this.questiontype = questiontype;
	}

	public Subclass getSubclass() {
		return subclass;
	}

	public void setSubclass(Subclass subclass) {
		this.subclass = subclass;
	}

	public Affect getAffect() {
		return affect;
	}

	public void setAffect(Affect affect) {
		this.affect = affect;
	}

	public Hr getHr() {
		return hr;
	}

	public void setHr(Hr hr) {
		this.hr = hr;
	}

	public EmailGroup getEmailGroup() {
		return emailgroup;
	}

	public void setEmailGroup(EmailGroup emailgroup) {
		this.emailgroup = emailgroup;
	}

}
