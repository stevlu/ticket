-- Create and populate tables
prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_DEPARTMENT...
drop table TKT_DEPARTMENT cascade constraints;
prompt Creating TKT_DEPARTMENT...
create table TKT_DEPARTMENT
(
  id       NUMBER(11) not null,
  name     VARCHAR2(32),
  parentid NUMBER(11),
  deppath  VARCHAR2(255),
  enabled  NUMBER(4) default 1,
  isparent NUMBER(4) default 0
)
;

prompt Disabling triggers for TKT_DEPARTMENT...
alter table TKT_DEPARTMENT disable all triggers;
prompt Loading TKT_DEPARTMENT...
insert into TKT_DEPARTMENT (id, name, parentid, deppath, enabled, isparent)
values (5, '客户服务A组', 4, '.1.4.5', 1, 0);
insert into TKT_DEPARTMENT (id, name, parentid, deppath, enabled, isparent)
values (7, '客户服务C组', 4, '.1.4.7', 1, 0);
insert into TKT_DEPARTMENT (id, name, parentid, deppath, enabled, isparent)
values (8, '客户服务B组', 4, '.1.4.8', 1, 0);
insert into TKT_DEPARTMENT (id, name, parentid, deppath, enabled, isparent)
values (1, 'Unicharm', -1, '.1', 1, 1);
insert into TKT_DEPARTMENT (id, name, parentid, deppath, enabled, isparent)
values (4, 'CRM部门', 1, '.1.4', 1, 1);
commit;
prompt 5 records loaded
prompt Enabling triggers for TKT_DEPARTMENT...
alter table TKT_DEPARTMENT enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_EMAILGROUP...
drop table TKT_EMAILGROUP cascade constraints;
prompt Creating TKT_EMAILGROUP...
create table TKT_EMAILGROUP
(
  group_id    VARCHAR2(20) not null,
  description VARCHAR2(20) not null,
  email       VARCHAR2(100),
  flag        NUMBER not null
)
;

prompt Disabling triggers for TKT_EMAILGROUP...
alter table TKT_EMAILGROUP disable all triggers;
prompt Loading TKT_EMAILGROUP...
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G001', 'Helpdesk', 'helpdesk@neusoft.com', 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G002', 'Network', 'network@neusoft.com', 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G003', 'RDS', 'rdssupport@neusoft.com', 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G004', 'Application', null, 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G005', 'SAP', 'luxf@neusoft.com', 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G006', 'Unicharm', 'stevlu@qq.com', 1);
insert into TKT_EMAILGROUP (group_id, description, email, flag)
values ('G007', 'Other', 'othersupport@neusoft.com', 1);
commit;
prompt 7 records loaded
prompt Enabling triggers for TKT_EMAILGROUP...
alter table TKT_EMAILGROUP enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_HR...
drop table TKT_HR cascade constraints;
prompt Creating TKT_HR...
create table TKT_HR
(
  id       NUMBER(11) not null,
  name     VARCHAR2(32),
  phone    CHAR(11),
  email    VARCHAR2(32),
  address  VARCHAR2(64),
  enabled  NUMBER(4) default 1,
  username VARCHAR2(255),
  password VARCHAR2(255),
  userface VARCHAR2(255),
  dept     NUMBER(4)
)
;

prompt Disabling triggers for TKT_HR...
alter table TKT_HR disable all triggers;
prompt Loading TKT_HR...
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (3, '管理员', '18568887789', 'admin@neusoft.com', null, 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://img.zcool.cn/community/01988e55764a290000002d5cc0d161.jpg@900w_1l_2o_100sh.jpg', 1);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (1, '周宁', '18898345590', 'zhoun@neusoft.com', null, 1, 'zhoun', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/0192b4557649c600000059fffe77c3.jpg@900w_1l_2o_100sh.jpg', 5);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (11, '赵田广', '18568123377', 'zhaotg@neusoft.com', null, 1, 'zhaotg', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/0192b4557649c600000059fffe77c3.jpg@900w_1l_2o_100sh.jpg', 7);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (12, '钱炳坤', '18568128888', 'qianbk@neusoft.com', null, 1, 'qianbk', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/011f2c55764a460000002d5cecd789.jpg@900w_1l_2o_100sh.jpg', 8);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (10, '孙秀哲', '18568123366', 'sunxz@neusoft.com', null, 1, 'sunxz', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/01027b557649c500000059ff4efe62.jpg@900w_1l_2o_100sh.jpg', 5);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (5, '李松可', '18588989959', 'lisk@neusoft.com', null, 1, 'lisk', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/019642557649b800000059ff7aa892.jpg@900w_1l_2o_100sh.jpg', 5);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (2, '吴曦英', '18900993356', 'wuxy@neusoft.com', null, 1, 'wuxy', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/01d24c55764a230000002d5c75193c.jpg@900w_1l_2o_100sh.jpg', 5);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (4, '郑晓辉', '13911013432', 'zhengxh@neusoft.com', null, 1, 'zhengxh', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/01c80b55764a260000002d5cc90c81.jpg@900w_1l_2o_100sh.jpg', 8);
insert into TKT_HR (id, name, phone, email, address, enabled, username, password, userface, dept)
values (6, '王涵', '18898345356', 'wangh@neusoft.com', null, 1, 'wangh', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://img.zcool.cn/community/01ecfd557649c000000059ff30b7ec.jpg@900w_1l_2o_100sh.jpg', 5);
commit;
prompt 9 records loaded
prompt Enabling triggers for TKT_HR...
alter table TKT_HR enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_HR_ROLE...
drop table TKT_HR_ROLE cascade constraints;
prompt Creating TKT_HR_ROLE...
create table TKT_HR_ROLE
(
  id   NUMBER(11) not null,
  hrid NUMBER(11),
  rid  NUMBER(11)
)
;

prompt Disabling triggers for TKT_HR_ROLE...
alter table TKT_HR_ROLE disable all triggers;
prompt Loading TKT_HR_ROLE...
insert into TKT_HR_ROLE (id, hrid, rid)
values (61, 10, 1);
insert into TKT_HR_ROLE (id, hrid, rid)
values (62, 10, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (63, 11, 1);
insert into TKT_HR_ROLE (id, hrid, rid)
values (64, 11, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (69, 4, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (59, 2, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (52, 5, 1);
insert into TKT_HR_ROLE (id, hrid, rid)
values (57, 6, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (1, 3, 6);
insert into TKT_HR_ROLE (id, hrid, rid)
values (65, 7, 3);
insert into TKT_HR_ROLE (id, hrid, rid)
values (55, 12, 1);
insert into TKT_HR_ROLE (id, hrid, rid)
values (74, 1, 1);
commit;
prompt 12 records loaded
prompt Enabling triggers for TKT_HR_ROLE...
alter table TKT_HR_ROLE enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_SYSMSG...
drop table TKT_SYSMSG cascade constraints;
prompt Creating TKT_SYSMSG...
create table TKT_SYSMSG
(
  id    NUMBER(11) not null,
  mid   NUMBER(11),
  type  NUMBER(11) default 0,
  hrid  NUMBER(11),
  state NUMBER(11) default 0
)
;

prompt Disabling triggers for TKT_SYSMSG...
alter table TKT_SYSMSG disable all triggers;
prompt Loading TKT_SYSMSG...
prompt Table is empty
prompt Enabling triggers for TKT_SYSMSG...
alter table TKT_SYSMSG enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_TABCYNJLOG...
drop table TKT_TABCYNJLOG cascade constraints;
prompt Creating TKT_TABCYNJLOG...
create table TKT_TABCYNJLOG
(
  logid          VARCHAR2(20) not null,
  declaration    VARCHAR2(20),
  source         VARCHAR2(20),
  server         VARCHAR2(20),
  question_type1 VARCHAR2(20),
  question_type2 VARCHAR2(20),
  title          VARCHAR2(500),
  describe       VARCHAR2(1000),
  emergency      VARCHAR2(20),
  affect         VARCHAR2(20),
  priority       VARCHAR2(20),
  createddate    DATE,
  customername   VARCHAR2(100),
  customerid     VARCHAR2(200),
  address        VARCHAR2(200),
  vip            VARCHAR2(6),
  tel_1          VARCHAR2(100),
  e_mail         VARCHAR2(400),
  mobile         VARCHAR2(200),
  status         VARCHAR2(20),
  assignee       VARCHAR2(20),
  emailgroup     VARCHAR2(20)
)
;
comment on column TKT_TABCYNJLOG.logid
  is '工单编号';
comment on column TKT_TABCYNJLOG.declaration
  is '申报形式';
comment on column TKT_TABCYNJLOG.source
  is '来源';
comment on column TKT_TABCYNJLOG.server
  is '服务分类';
comment on column TKT_TABCYNJLOG.question_type1
  is '问题分类';
comment on column TKT_TABCYNJLOG.question_type2
  is '问题子分类';
comment on column TKT_TABCYNJLOG.title
  is '事件标题';
comment on column TKT_TABCYNJLOG.describe
  is '事件描述';
comment on column TKT_TABCYNJLOG.emergency
  is '紧急程度';
comment on column TKT_TABCYNJLOG.affect
  is '影响范围';
comment on column TKT_TABCYNJLOG.priority
  is '优先级';
comment on column TKT_TABCYNJLOG.createddate
  is '生成工单的时间';
comment on column TKT_TABCYNJLOG.customername
  is '申报人';
comment on column TKT_TABCYNJLOG.customerid
  is '申报人组织';
comment on column TKT_TABCYNJLOG.address
  is '申报人地点';
comment on column TKT_TABCYNJLOG.vip
  is 'VIP标识';
comment on column TKT_TABCYNJLOG.tel_1
  is '申报人座机';
comment on column TKT_TABCYNJLOG.e_mail
  is '申报人邮箱';
comment on column TKT_TABCYNJLOG.mobile
  is '申报人手机';
comment on column TKT_TABCYNJLOG.status
  is '工单状态';
comment on column TKT_TABCYNJLOG.assignee
  is '工单责任人';
create unique index LOGID_TKT_TABCYNJLOG on TKT_TABCYNJLOG (LOGID);

prompt Disabling triggers for TKT_TABCYNJLOG...
alter table TKT_TABCYNJLOG disable all triggers;
prompt Loading TKT_TABCYNJLOG...
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000025', 'D001', 'SC001', 'SE002', 'Q00200', 'Q00201', '测试时间标题180912-1', '测试时间描述180912-1' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 15:44:38' || chr(13) || '' || chr(10) || '测试时间描述180912-1' || chr(10) || '测试时间描述180912-1' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 15:44:49' || chr(13) || '' || chr(10) || '测试时间描述180912-1' || chr(10) || '测试时间描述180912-2' || chr(10) || '测试时间描述180912-3' || chr(10) || '测试时间描述180912-4', 'EM003', 'A002', 'P002', to_date('12-09-2018 14:55:32', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G001');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000026', 'D001', 'SC001', 'SE003', 'Q00100', 'Q00104', '杀毒软件提示有病毒', '每次打开PPT文件时，杀毒软件都会提示有病毒，并自动关闭', 'EM003', 'A001', 'P003', to_date('12-09-2018 16:41:38', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G001');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000012', 'D004', 'SC002', 'SE002', 'Q00300', null, '事件标题1', null, 'EM004', 'A002', 'P001', to_date('12-09-2018 10:28:37', 'dd-mm-yyyy hh24:mi:ss'), '大强', '东软北京研发中心', null, '1', '123', null, '111', 'New', null, 'G005');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000011', 'D001', 'SC002', 'SE002', 'Q00300', 'Q00105', '时间变体', '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 11:07:35' || chr(13) || '' || chr(10) || '我的服务台' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 11:08:09' || chr(13) || '' || chr(10) || '', 'EM004', 'A002', 'P001', to_date('12-09-2018 10:22:18', 'dd-mm-yyyy hh24:mi:ss'), 'SR18091200011', '123', null, '1', '18091200011', '11', '18091200011', 'New', null, 'G002');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000015', 'D002', 'SC003', 'SE003', 'Q00200', 'Q00205', 'test', 'test', 'EM004', 'A004', 'P004', to_date('12-09-2018 10:34:47', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G003');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000016', 'D004', 'SC004', 'SE004', 'Q00100', 'Q00102', null, null, 'EM003', 'A003', 'P003', to_date('12-09-2018 10:37:29', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000017', 'D003', 'SC005', 'SE001', 'Q00300', null, null, null, 'EM001', 'A001', 'P002', to_date('12-09-2018 10:38:56', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180911000008', null, 'SC001', null, null, null, '标题保存测试', '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/29 15:33:53' || chr(13) || '' || chr(10) || '单位输入处理' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/29 15:33:59' || chr(13) || '' || chr(10) || '尝试输入', null, null, null, to_date('11-09-2018 15:02:26', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, '1', null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000018', null, 'SC003', 'SE001', null, null, null, null, null, null, null, to_date('12-09-2018 10:40:05', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000019', 'D002', 'SC004', 'SE002', 'Q00200', 'Q00207', '操作系统有异样', '2018/11/29 15:06:39' || chr(13) || '' || chr(10) || '登陆不了' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '', null, 'A001', null, to_date('12-09-2018 10:40:39', 'dd-mm-yyyy hh24:mi:ss'), '卢雪峰', '东软云科技', null, '0', null, 'luxf@neusoft.com', '13910721096', 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000020', null, 'SC001', null, null, null, null, null, null, null, null, to_date('12-09-2018 10:41:20', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000021', null, 'SC002', null, null, null, null, null, null, null, null, to_date('12-09-2018 10:41:30', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000022', null, 'SC003', null, null, null, null, null, null, null, null, to_date('12-09-2018 10:41:37', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000023', null, 'SC004', null, null, null, null, null, null, null, null, to_date('12-09-2018 10:41:48', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G007');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180912000024', null, 'SC005', null, null, null, null, null, null, null, null, to_date('12-09-2018 10:42:00', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, 'New', null, 'G007');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR180918000027', 'D001', 'SC002', 'SE002', 'Q00200', 'Q00202', '网络无法连接', '网络数据', 'EM001', 'A001', 'P001', to_date('18-09-2018 14:15:12', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, '1', null, null, null, 'New', null, 'G007');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181009000044', 'D004', 'SC002', 'SE001', 'Q00600', 'Q00601', '测试2018-10-09', '2018/11/06 09:36:21' || chr(13) || '' || chr(10) || '这样显示是怎么回事呢？奇怪，请帮助查看' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 17:53:17' || chr(13) || '' || chr(10) || '处理以下，谢谢！' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018-10-09 15：57' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 12:13:18' || chr(13) || '' || chr(10) || 'sdf' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 12:13:33' || chr(13) || '' || chr(10) || 'aaad ', 'EM002', 'A004', 'P001', to_date('09-10-2018 15:57:20', 'dd-mm-yyyy hh24:mi:ss'), '申报人1', '组织', null, '0', '13998460912', '44@qq.com', null, 'New', null, 'G004');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181009000045', 'D002', 'SC001', 'SE002', 'Q00400', 'Q00401', '测试10-09', '2018/11/08 18:01:36' || chr(13) || '' || chr(10) || ' {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 18:01:29' || chr(13) || '' || chr(10) || '处理一下，谢谢' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 16:03:43' || chr(13) || '' || chr(10) || '尾巴？' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '测试10-09 16：01', 'EM003', 'A002', 'P003', to_date('09-10-2018 16:02:15', 'dd-mm-yyyy hh24:mi:ss'), 'ITtest', '东软', '黄浦路901', '1', '111', '000', '99999', 'New', null, 'G005');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181009000046', 'D003', 'SC001', 'SE002', 'Q00300', null, '2018-10-09-17：03', '2018/11/29 17:51:33' || chr(13) || '' || chr(10) || ' {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/29 17:51:25' || chr(13) || '' || chr(10) || '暂时处理一i西安，即序' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/29 15:04:38' || chr(13) || '' || chr(10) || ' {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/29 12:40:30' || chr(13) || '' || chr(10) || ' {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 17:28:49' || chr(13) || '' || chr(10) || 'keyi' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 16:03:22' || chr(13) || '' || chr(10) || '尾巴？' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 15:56:05' || chr(13) || '' || chr(10) || '可以了，包括autofocus' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 15:55:22' || chr(13) || '' || chr(10) || '的确，哈哈，可以了。' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 15:55:10' || chr(13) || '' || chr(10) || '这次呢，应该可以了吧' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 15:51:20' || chr(13) || '' || chr(10) || '其实是倒序更合理呗2018/11/05 15:50:46' || chr(13) || '' || chr(10) || '倒序更合理2018-10-09-17：03测试' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/02 17:33:12' || chr(13) || '' || chr(10) || 'add something' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '', 'EM004', 'A001', 'P004', to_date('24-10-2018 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'IT测试', '云科技', '河口园区', '0', '8994', '533', '88888', 'New', null, 'G005');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181009000042', 'D001', 'SC001', 'SE003', 'Q00100', 'Q00102', '测试2018-10-09 15：24', '测试2018-10-09 15：24 开始测试', 'EM001', 'A001', 'P003', to_date('09-10-2018 15:25:07', 'dd-mm-yyyy hh24:mi:ss'), 'IT测试', '云科技', '河口园区', '0', '8994', '533', '88888', 'New', null, 'G005');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181009000047', 'D001', 'SC002', 'SE003', 'Q00100', 'Q00106', '测试测试测试长度长度带引号测试测试测试长度长度带引号测试测试测试长度长度带引号！@#￥%……&*（）——', '2018/12/05 16:29:48' || chr(13) || '' || chr(10) || '处理值日' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:56:49' || chr(13) || '' || chr(10) || ' {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:36:51' || chr(13) || '' || chr(10) || '可以再次关闭 {孙秀哲关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:35:35' || chr(13) || '' || chr(10) || '可以关闭，close孙秀哲关闭了工单' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:34:08' || chr(13) || '' || chr(10) || '孙秀哲关闭了工单' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:33:53' || chr(13) || '' || chr(10) || '孙秀哲关闭了工单' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:25:53' || chr(13) || '' || chr(10) || '10关闭了工单' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:23:37' || chr(13) || '' || chr(10) || 'undefined关闭了工单' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 17:14:27' || chr(13) || '' || chr(10) || '重新分配' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/08 12:25:35' || chr(13) || '' || chr(10) || '换行测试' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/07 16:43:37' || chr(13) || '' || chr(10) || 'test email, test status' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '测试测试测试测试测试测试测试测试测试测试测试测试', 'EM001', 'A004', 'P001', to_date('24-10-2018 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'ITtest', '东软', '黄浦路901', '1', '111', 'sss', '99999', 'New', null, 'G006');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181010000049', 'D001', 'SC001', 'SE002', 'Q00200', 'Q00201', '邮件测通显示标题', '事件描述：22018-10-10', 'EM001', 'A003', 'P002', to_date('24-10-2018 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), '卢雪峰', '云科技北京', '北京市东城区王府井大街138号', '1', '01089997777', 'luxf@neusoft.com', '13910701976', 'New', null, 'G006');
insert into TKT_TABCYNJLOG (logid, declaration, source, server, question_type1, question_type2, title, describe, emergency, affect, priority, createddate, customername, customerid, address, vip, tel_1, e_mail, mobile, status, assignee, emailgroup)
values ('SR181010000050', 'D002', 'SC002', 'SE002', 'Q00100', 'Q00101', '事件标题：2018-10-10-12 biao ti 21     就是很长查查看很长很长，看看显示的正不正常，测试一下长度的影响。', '2018/11/22 16:48:17' || chr(13) || '' || chr(10) || ' {李松可关闭了工单}' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/06 14:58:25' || chr(13) || '' || chr(10) || '添加事件转发emailgroup' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/06 11:44:38' || chr(13) || '' || chr(10) || '不错，显示正常在mini模式下' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/11/05 17:55:47' || chr(13) || '' || chr(10) || '继续加强训练' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 14:41:23' || chr(13) || '' || chr(10) || '处理的结论是：' || chr(10) || '用户自行安装' || chr(10) || '不需要人工干预' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 14:41:47' || chr(13) || '' || chr(10) || '重复申报，重复类型，可关闭。' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 14:42:41' || chr(13) || '' || chr(10) || '和用户无法正常联系，再打电话。' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 15:01:33' || chr(13) || '' || chr(10) || '1' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 15:04:49' || chr(13) || '' || chr(10) || '参加会议内容记录' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/25 15:15:42' || chr(13) || '' || chr(10) || '输入今天agent的意见1' || chr(10) || '输入今天agent的意见1' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/30 13:55:11' || chr(13) || '' || chr(10) || '继续处理之' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '2018/10/31 10:10:24' || chr(13) || '' || chr(10) || '继续', 'EM003', 'A001', 'P003', to_date('07-11-2018 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), '张先生', '北京分公司', '北京市东城区王府井大街138号', '0', '01089997777dd', 'stevlu@stevlu.com', '18910056890', 'New', null, 'G005');
commit;
prompt 23 records loaded
prompt Enabling triggers for TKT_TABCYNJLOG...
alter table TKT_TABCYNJLOG enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_MENU_ROLE...
drop table TKT_MENU_ROLE cascade constraints;
prompt Creating TKT_MENU_ROLE...
create table TKT_MENU_ROLE
(
  id  INTEGER not null,
  mid INTEGER,
  rid INTEGER
)
;
create index TKT_MENU_ROLE_NORMAL on TKT_MENU_ROLE (ID)
  compress;

prompt Disabling triggers for TKT_MENU_ROLE...
alter table TKT_MENU_ROLE disable all triggers;
prompt Loading TKT_MENU_ROLE...
insert into TKT_MENU_ROLE (id, mid, rid)
values (105, 26, 1);
insert into TKT_MENU_ROLE (id, mid, rid)
values (106, 29, 1);
insert into TKT_MENU_ROLE (id, mid, rid)
values (107, 30, 1);
insert into TKT_MENU_ROLE (id, mid, rid)
values (108, 31, 1);
insert into TKT_MENU_ROLE (id, mid, rid)
values (109, 29, 3);
insert into TKT_MENU_ROLE (id, mid, rid)
values (110, 30, 3);
insert into TKT_MENU_ROLE (id, mid, rid)
values (111, 31, 3);
insert into TKT_MENU_ROLE (id, mid, rid)
values (279, 29, 2);
insert into TKT_MENU_ROLE (id, mid, rid)
values (280, 29, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (281, 30, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (162, 7, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (282, 31, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (168, 14, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (169, 15, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (170, 16, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (177, 23, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (178, 25, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (179, 26, 6);
insert into TKT_MENU_ROLE (id, mid, rid)
values (247, 7, 4);
insert into TKT_MENU_ROLE (id, mid, rid)
values (250, 7, 2);
commit;
prompt 20 records loaded
prompt Enabling triggers for TKT_MENU_ROLE...
alter table TKT_MENU_ROLE enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_MSGCONTENT...
drop table TKT_MSGCONTENT cascade constraints;
prompt Creating TKT_MSGCONTENT...
create table TKT_MSGCONTENT
(
  id         NUMBER(11) not null,
  title      VARCHAR2(64),
  message    VARCHAR2(255),
  createdate DATE default CURRENT_TIMESTAMP not null
)
;

prompt Disabling triggers for TKT_MSGCONTENT...
alter table TKT_MSGCONTENT disable all triggers;
prompt Loading TKT_MSGCONTENT...
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (15, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('05-12-2018 17:08:21', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (22, 'SR181009000044 已被分配给 孙秀哲', 'SR181009000044 已被分配给 孙秀哲', to_date('05-12-2018 17:32:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (31, 'asdf', 'asfd', to_date('06-12-2018 10:46:56', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (35, 's', 's', to_date('11-12-2018 10:55:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (36, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('11-12-2018 10:56:34', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (4, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('05-12-2018 16:10:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (14, 'asdf', 'asdf', to_date('05-12-2018 17:07:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (8, 'SR181009000047 已被分配给 孙秀哲', 'SR181009000047 已被分配给 孙秀哲', to_date('05-12-2018 16:28:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (11, 'asdf', 'asdf', to_date('05-12-2018 16:42:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (13, 'asdf', 'asdf', to_date('05-12-2018 16:42:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (17, 'asf', 'asdf', to_date('05-12-2018 17:08:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (18, 'SR181010000049 已被分配给 孙秀哲', 'SR181010000049 已被分配给 孙秀哲', to_date('05-12-2018 17:27:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (21, 'adsf', 'asfasdfasfd', to_date('05-12-2018 17:32:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (27, 'SR181009000046 已被分配给 李松可', 'SR181009000046 已被分配给 李松可', to_date('05-12-2018 17:58:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (28, 'SR181009000047 已被分配给 孙秀哲', 'SR181009000047 已被分配给 孙秀哲', to_date('05-12-2018 17:59:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (29, '通知标题', '通知内容', to_date('06-12-2018 10:27:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (30, 'a', 'ddd', to_date('06-12-2018 10:44:50', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (6, 'aa', 'aa', to_date('05-12-2018 16:27:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (7, 'd', 'dd', to_date('05-12-2018 16:28:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (1, 'title', 'message', to_date('05-12-2018 00:00:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (9, 'SR181010000050 已被分配给 李松可', 'SR181010000050 已被分配给 李松可', to_date('05-12-2018 16:33:53', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (10, 'a''s''d''f', 'asdf', to_date('05-12-2018 16:34:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (19, 'SR181009000047 已被分配给 孙秀哲', 'SR181009000047 已被分配给 孙秀哲', to_date('05-12-2018 17:28:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (20, 'SR181009000045 已被分配给 孙秀哲', 'SR181009000045 已被分配给 孙秀哲', to_date('05-12-2018 17:29:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (23, 'SR180918000027 已被分配给 孙秀哲', 'SR180918000027 已被分配给 孙秀哲', to_date('05-12-2018 17:33:34', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (24, 'a', 'asdf', to_date('05-12-2018 17:51:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (25, 'asdf', 'asdf', to_date('05-12-2018 17:51:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (26, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('05-12-2018 17:52:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (33, 'SR181010000050 已被分配给 李松可', 'SR181010000050 已被分配给 李松可', to_date('06-12-2018 14:28:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (34, 'aa', 'dd', to_date('06-12-2018 17:12:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (5, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('05-12-2018 16:24:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (12, 'SR181010000050 已被分配给 孙秀哲', 'SR181010000050 已被分配给 孙秀哲', to_date('05-12-2018 16:42:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (16, 'SR181009000046 已被分配给 孙秀哲', 'SR181009000046 已被分配给 孙秀哲', to_date('05-12-2018 17:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (2, '开会啦', '召集开会', to_date('05-12-2018 16:06:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (3, '开会', '开会啦，召集开会。', to_date('05-12-2018 16:07:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into TKT_MSGCONTENT (id, title, message, createdate)
values (32, 'as', 'd', to_date('06-12-2018 11:02:26', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 36 records loaded
prompt Enabling triggers for TKT_MSGCONTENT...
alter table TKT_MSGCONTENT enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_MENU...
drop table TKT_MENU cascade constraints;
prompt Creating TKT_MENU...
create table TKT_MENU
(
  id          NUMBER(11) not null,
  url         VARCHAR2(64),
  path        VARCHAR2(64),
  component   VARCHAR2(64),
  name        VARCHAR2(64),
  iconcls     VARCHAR2(64),
  keepalive   INTEGER,
  requireauth NUMBER(4),
  parentid    NUMBER(11),
  enabled     NUMBER(4) default 1
)
;
create index TKT_MENU_NORMAL_ID on TKT_MENU (ID)
  compress;

prompt Disabling triggers for TKT_MENU...
alter table TKT_MENU disable all triggers;
prompt Loading TKT_MENU...
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (1, '/', null, null, '所有', null, 0, null, null, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (3, '/', '/home', 'Home', '工单管理', 'fa fa-list', 0, 1, 1, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', 0, 1, 1, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', null, 0, 1, 6, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', null, 0, 1, 6, 0);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', null, 0, 1, 6, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (30, '/ticket/all/**', '/tkt/all', 'TktAll', '所有工单', null, 0, 1, 3, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (29, '/ticket/list/**', '/tkt/list', 'TktList', '我的工单', null, 0, 1, 3, 1);
insert into TKT_MENU (id, url, path, component, name, iconcls, keepalive, requireauth, parentid, enabled)
values (31, '/ticket/new/**', '/tkt/new', 'TktNew', '待分配工单', null, 0, 1, 3, 1);
commit;
prompt 9 records loaded
prompt Enabling triggers for TKT_MENU...
alter table TKT_MENU enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping TKT_ROLE...
drop table TKT_ROLE cascade constraints;
prompt Creating TKT_ROLE...
create table TKT_ROLE
(
  id     NUMBER(11) not null,
  name   VARCHAR2(64),
  namezh VARCHAR2(64)
)
;

prompt Disabling triggers for TKT_ROLE...
alter table TKT_ROLE disable all triggers;
prompt Loading TKT_ROLE...
insert into TKT_ROLE (id, name, namezh)
values (1, 'ROLE_manager', '组长');
insert into TKT_ROLE (id, name, namezh)
values (3, 'ROLE_agent', '组员');
insert into TKT_ROLE (id, name, namezh)
values (6, 'ROLE_admin', '系统管理员');
commit;
prompt 3 records loaded
prompt Enabling triggers for TKT_ROLE...
alter table TKT_ROLE enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_DECLARATION...
drop table LOG_DECLARATION cascade constraints;
prompt Creating LOG_DECLARATION...
create table LOG_DECLARATION
(
  declaration_id VARCHAR2(20),
  description    VARCHAR2(20),
  flag           NUMBER
)
;
comment on column LOG_DECLARATION.declaration_id
  is 'ID';
comment on column LOG_DECLARATION.description
  is '描述';
comment on column LOG_DECLARATION.flag
  is '标识';

prompt Disabling triggers for LOG_DECLARATION...
alter table LOG_DECLARATION disable all triggers;
prompt Loading LOG_DECLARATION...
insert into LOG_DECLARATION (declaration_id, description, flag)
values ('D001', '电话', 1);
insert into LOG_DECLARATION (declaration_id, description, flag)
values ('D002', '手机', 1);
insert into LOG_DECLARATION (declaration_id, description, flag)
values ('D003', '邮件', 1);
insert into LOG_DECLARATION (declaration_id, description, flag)
values ('D004', '微信', 1);
commit;
prompt 4 records loaded
prompt Enabling triggers for LOG_DECLARATION...
alter table LOG_DECLARATION enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_SOURCE...
drop table LOG_SOURCE cascade constraints;
prompt Creating LOG_SOURCE...
create table LOG_SOURCE
(
  source_id   VARCHAR2(20),
  description VARCHAR2(20),
  flag        NUMBER
)
;
comment on column LOG_SOURCE.source_id
  is 'id';
comment on column LOG_SOURCE.description
  is '描述';
comment on column LOG_SOURCE.flag
  is '标识';

prompt Disabling triggers for LOG_SOURCE...
alter table LOG_SOURCE disable all triggers;
prompt Loading LOG_SOURCE...
insert into LOG_SOURCE (source_id, description, flag)
values ('SC001', '用户发现', 1);
insert into LOG_SOURCE (source_id, description, flag)
values ('SC002', '服务台发现', 1);
insert into LOG_SOURCE (source_id, description, flag)
values ('SC003', 'UCIT发现', 1);
insert into LOG_SOURCE (source_id, description, flag)
values ('SC004', 'UCBT务发现', 1);
insert into LOG_SOURCE (source_id, description, flag)
values ('SC005', '第三方发现', 1);
commit;
prompt 5 records loaded
prompt Enabling triggers for LOG_SOURCE...
alter table LOG_SOURCE enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_PRIORITY...
drop table LOG_PRIORITY cascade constraints;
prompt Creating LOG_PRIORITY...
create table LOG_PRIORITY
(
  priority_id VARCHAR2(20),
  description VARCHAR2(20),
  flag        NUMBER
)
;
comment on column LOG_PRIORITY.priority_id
  is 'ID';
comment on column LOG_PRIORITY.description
  is '描述';
comment on column LOG_PRIORITY.flag
  is '标识';

prompt Disabling triggers for LOG_PRIORITY...
alter table LOG_PRIORITY disable all triggers;
prompt Loading LOG_PRIORITY...
insert into LOG_PRIORITY (priority_id, description, flag)
values ('P001', 'P1', 1);
insert into LOG_PRIORITY (priority_id, description, flag)
values ('P002', 'P2', 1);
insert into LOG_PRIORITY (priority_id, description, flag)
values ('P003', 'P3', 1);
insert into LOG_PRIORITY (priority_id, description, flag)
values ('P004', 'P4', 1);
commit;
prompt 4 records loaded
prompt Enabling triggers for LOG_PRIORITY...
alter table LOG_PRIORITY enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_SERVER...
drop table LOG_SERVER cascade constraints;
prompt Creating LOG_SERVER...
create table LOG_SERVER
(
  server_id   VARCHAR2(20),
  description VARCHAR2(20),
  flag        NUMBER
)
;
comment on column LOG_SERVER.server_id
  is 'ID';
comment on column LOG_SERVER.description
  is '描述';
comment on column LOG_SERVER.flag
  is '标识';

prompt Disabling triggers for LOG_SERVER...
alter table LOG_SERVER disable all triggers;
prompt Loading LOG_SERVER...
insert into LOG_SERVER (server_id, description, flag)
values ('SE001', '咨询请求', 1);
insert into LOG_SERVER (server_id, description, flag)
values ('SE002', '服务请求', 1);
insert into LOG_SERVER (server_id, description, flag)
values ('SE003', '事件申报', 1);
insert into LOG_SERVER (server_id, description, flag)
values ('SE004', '超出服务', 1);
commit;
prompt 4 records loaded
prompt Enabling triggers for LOG_SERVER...
alter table LOG_SERVER enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_QUESTIONTYPE...
drop table LOG_QUESTIONTYPE cascade constraints;
prompt Creating LOG_QUESTIONTYPE...
create table LOG_QUESTIONTYPE
(
  question_id VARCHAR2(20),
  description VARCHAR2(20),
  orderno     NUMBER,
  flag        NUMBER
)
;
comment on column LOG_QUESTIONTYPE.question_id
  is 'ID';
comment on column LOG_QUESTIONTYPE.description
  is '描述';
comment on column LOG_QUESTIONTYPE.orderno
  is '排序标识';
comment on column LOG_QUESTIONTYPE.flag
  is '在用标识';

prompt Disabling triggers for LOG_QUESTIONTYPE...
alter table LOG_QUESTIONTYPE disable all triggers;
prompt Loading LOG_QUESTIONTYPE...
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00100', 'PC问题', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00200', '办公软件', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00300', '邮件问题', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00400', '应用软件', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00500', '账户问题', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00600', '网络问题', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00700', '外设问题', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00800', '手机和平板', null, 1);
insert into LOG_QUESTIONTYPE (question_id, description, orderno, flag)
values ('Q00900', '会议支持', null, 1);
commit;
prompt 9 records loaded
prompt Enabling triggers for LOG_QUESTIONTYPE...
alter table LOG_QUESTIONTYPE enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_SUBCLASS...
drop table LOG_SUBCLASS cascade constraints;
prompt Creating LOG_SUBCLASS...
create table LOG_SUBCLASS
(
  subclass_id VARCHAR2(20),
  questionid  VARCHAR2(20),
  description VARCHAR2(20),
  orderno     NUMBER,
  flag        NUMBER
)
;
comment on column LOG_SUBCLASS.subclass_id
  is 'ID';
comment on column LOG_SUBCLASS.questionid
  is '问题分类的ID,和问题分类表关联';
comment on column LOG_SUBCLASS.description
  is '描述';
comment on column LOG_SUBCLASS.orderno
  is '排序标识';
comment on column LOG_SUBCLASS.flag
  is '标识';

prompt Disabling triggers for LOG_SUBCLASS...
alter table LOG_SUBCLASS disable all triggers;
prompt Loading LOG_SUBCLASS...
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00101', 'Q00100', 'PC硬件', 1, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00201', 'Q00200', 'CAD', 1, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00401', 'Q00400', 'SAP', 1, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00604', 'Q00600', '互联网', 4, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00701', 'Q00700', '打印机', 1, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00106', 'Q00100', '数据备份', 6, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00105', 'Q00100', '补丁问题', 5, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00104', 'Q00100', '病毒问题', 4, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00103', 'Q00100', '系统设置', 3, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00102', 'Q00100', '操作系统', 2, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00207', 'Q00200', 'PDF', 7, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00206', 'Q00200', 'Office-ppt', 6, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00205', 'Q00200', 'Office-Excel', 5, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00204', 'Q00200', 'Office-Word', 4, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00203', 'Q00200', 'Zip软件', 3, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00202', 'Q00200', 'PS', 2, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00403', 'Q00400', 'HER', 3, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00402', 'Q00400', 'EDI', 2, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00603', 'Q00600', 'VPN', 3, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00602', 'Q00600', '代理服务器', 2, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00601', 'Q00600', 'WIFI', 1, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00606', 'Q00600', '个人网络', 6, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00605', 'Q00600', '内部网络', 5, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00703', 'Q00700', '投影仪', 3, 1);
insert into LOG_SUBCLASS (subclass_id, questionid, description, orderno, flag)
values ('Q00702', 'Q00700', '扫描仪', 2, 1);
commit;
prompt 25 records loaded
prompt Enabling triggers for LOG_SUBCLASS...
alter table LOG_SUBCLASS enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping LOG_AFFECT...
drop table LOG_AFFECT cascade constraints;
prompt Creating LOG_AFFECT...
create table LOG_AFFECT
(
  affect_id   VARCHAR2(20),
  description VARCHAR2(20),
  flag        NUMBER
)
;
comment on column LOG_AFFECT.affect_id
  is 'ID';
comment on column LOG_AFFECT.description
  is '描述';
comment on column LOG_AFFECT.flag
  is '标识';

prompt Disabling triggers for LOG_AFFECT...
alter table LOG_AFFECT disable all triggers;
prompt Loading LOG_AFFECT...
insert into LOG_AFFECT (affect_id, description, flag)
values ('A001', '个人', 1);
insert into LOG_AFFECT (affect_id, description, flag)
values ('A002', '部门', 1);
insert into LOG_AFFECT (affect_id, description, flag)
values ('A003', '区域 ', 1);
insert into LOG_AFFECT (affect_id, description, flag)
values ('A004', '整个公司', 1);
commit;
prompt 4 records loaded
prompt Enabling triggers for LOG_AFFECT...
alter table LOG_AFFECT enable all triggers;

set feedback on
set define on
prompt Done


prompt PL/SQL Developer Export Tables for user ELITE_YNJ@TAF
prompt Created by admin on 2018年12月11日
set feedback off
set define off

prompt Dropping C_VIP...
drop table C_VIP cascade constraints;
prompt Creating C_VIP...
create table C_VIP
(
  vipid   VARCHAR2(2),
  vipdesc VARCHAR2(2)
)
;

prompt Disabling triggers for C_VIP...
alter table C_VIP disable all triggers;
prompt Loading C_VIP...
insert into C_VIP (vipid, vipdesc)
values ('1', 'Y');
insert into C_VIP (vipid, vipdesc)
values ('0', 'N');
commit;
prompt 2 records loaded
prompt Enabling triggers for C_VIP...
alter table C_VIP enable all triggers;

set feedback on
set define on
prompt Done



-- Create sequence
create sequence SEQ_TKT_HR_ROLE_NEWID
minvalue 1
maxvalue 99999999
start with 75
increment by 1
cache 2;
create sequence SEQ_TKT_MENU_ROLE_NEWID
minvalue 1
maxvalue 99999999
start with 113
increment by 1
cache 2;
create sequence SEQ_TKT_SYSMSG_NEWID
minvalue 1
maxvalue 99999999
start with 1157
increment by 1
cache 2;
/

-- Create trigger
create or replace trigger trigger_tkt_role_newid
  before insert on tkt_role
  for each row
declare
  -- local variable here
begin
  select max(tkt_role.id) + 1 into :new.id from tkt_role;
end trigger_tkt_role_newid;
/


-- Create procedure
create or replace procedure tkt_addDep(depName   in varchar,
                                       parent_Id in int,
                                       enabled   in int,
                                       result    out int) is
  d_id       int;
  tmpDepPath varchar2(64);
begin
  select depPath into tmpDepPath from tkt_department where id = parent_Id;
  select max(tkt_department.id) + 1 into d_id from tkt_department;
  insert into tkt_department
    (id, name, parentId, enabled)
  values
    (d_id, depName, parent_Id, 1);
  --result2 := d_id;
  update tkt_department
     set depPath = tmpDepPath || '.' || d_id
   where id = d_id;
  update tkt_department set isParent = 1 where id = parent_Id;
  select count(*) into result from tkt_department;
  commit;
end tkt_addDep;
/
create or replace procedure tkt_deleteDep(did in int, result out int) is
  ecount int;
  pid    int;
  pcount int;
begin
  select count(*) into ecount from tkt_hr where dept = did;
  if ecount > 0 then
    result := -1;
  else
    select parentId into pid from tkt_department where id = did;
    delete from tkt_department
     where id = did
       and isParent = 0;
    select count(*) into result from tkt_department;
    select count(*) into pcount from tkt_department where parentId = pid;
    if pcount = 0 then
      update tkt_department set isParent = 0 where id = pid;
    end if;
  end if;
end tkt_deleteDep;
/