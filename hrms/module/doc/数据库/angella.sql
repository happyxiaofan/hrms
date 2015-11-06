prompt PL/SQL Developer import file
prompt Created on 2015Äê9ÔÂ23ÈÕ by Administrator
set feedback off
set define off
prompt Dropping T_MODE1_ACHIVE...
drop table T_MODE1_ACHIVE cascade constraints;
prompt Dropping T_MODE1_CONTRACT...
drop table T_MODE1_CONTRACT cascade constraints;
prompt Dropping T_MODE1_EMPLOYEE...
drop table T_MODE1_EMPLOYEE cascade constraints;
prompt Dropping T_MODE1_RECORD...
drop table T_MODE1_RECORD cascade constraints;
prompt Dropping T_MODE1_REWARD...
drop table T_MODE1_REWARD cascade constraints;
prompt Dropping t_mode1_achive...
drop table t_mode1_achive cascade constraints;
prompt Dropping t_mode1_employee...
drop table t_mode1_employee cascade constraints;
prompt Creating T_MODE1_ACHIVE...
create table T_MODE1_ACHIVE
(
  ARCID    NUMBER,
  EMPID    NUMBER,
  ARCNUM   VARCHAR2(40),
  ARCNAME  VARCHAR2(40),
  ABSTRACT VARCHAR2(100),
  REMARK   VARCHAR2(100)
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;

prompt Creating T_MODE1_CONTRACT...
create table T_MODE1_CONTRACT
(
  COSID     NUMBER,
  EMPID     NUMBER,
  EMPNAME   VARCHAR2(40),
  COSNUM    VARCHAR2(40),
  STARTDATE DATE,
  ENDDATE   DATE,
  JOB       VARCHAR2(40),
  CONTENT   VARCHAR2(100),
  AGREEMENT VARCHAR2(100)
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;

prompt Creating T_MODE1_EMPLOYEE...
create table T_MODE1_EMPLOYEE
(
  EMPID   NUMBER,
  EMPNAME VARCHAR2(40),
  EMPSEX  NUMBER,
  SCHOOL  VARCHAR2(20),
  DEGREE  VARCHAR2(20),
  DEPTID  NUMBER,
  JOB     VARCHAR2(20),
  RANKS   VARCHAR2(20),
  STATE   VARCHAR2(20)
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating T_MODE1_RECORD...
create table T_MODE1_RECORD
(
  RECORDID   NUMBER,
  EMPID      NUMBER,
  EMPNAME    VARCHAR2(40),
  JOBCONTENT VARCHAR2(40),
  PRORESULTS VARCHAR2(40),
  STIME      DATE,
  ETIME      DATE
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;

prompt Creating T_MODE1_REWARD...
create table T_MODE1_REWARD
(
  REWID      NUMBER,
  EMPID      NUMBER,
  EMPNAME    VARCHAR2(40),
  REWTYPE    VARCHAR2(40),
  REWDATE    DATE,
  REWTITLE   VARCHAR2(40),
  REWCONTENT VARCHAR2(40),
  REWLEVEL   NUMBER
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;

prompt Creating t_mode1_achive...
create table t_mode1_achive
(
  ARCID    NUMBER,
  EMPID    NUMBER,
  ARCNUM   VARCHAR2(40),
  ARCNAME  VARCHAR2(40),
  ABSTRACT VARCHAR2(100),
  REMARK   VARCHAR2(100)
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;

prompt Creating t_mode1_employee...
create table t_mode1_employee
(
  empid   NUMBER not null,
  empname VARCHAR2(40),
  empsex  NUMBER,
  school  VARCHAR2(20),
  degree  VARCHAR2(20),
  deptid  NUMBER,
  job     VARCHAR2(20),
  ranks   VARCHAR2(20),
  state   VARCHAR2(20)
)
tablespace ABANDON
  pctfree 10
  initrans 1
  maxtrans 255;
alter table t_mode1_employee
  add constraint PK_T_MODE1_EMPLOYEE primary key (empid)
  using index 
  tablespace ABANDON
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Disabling triggers for T_MODE1_ACHIVE...
alter table T_MODE1_ACHIVE disable all triggers;
prompt Disabling triggers for T_MODE1_CONTRACT...
alter table T_MODE1_CONTRACT disable all triggers;
prompt Disabling triggers for T_MODE1_EMPLOYEE...
alter table T_MODE1_EMPLOYEE disable all triggers;
prompt Disabling triggers for T_MODE1_RECORD...
alter table T_MODE1_RECORD disable all triggers;
prompt Disabling triggers for T_MODE1_REWARD...
alter table T_MODE1_REWARD disable all triggers;
prompt Disabling triggers for t_mode1_achive...
alter table t_mode1_achive disable all triggers;
prompt Disabling triggers for t_mode1_employee...
alter table t_mode1_employee disable all triggers;
prompt Loading T_MODE1_ACHIVE...
prompt Table is empty
prompt Loading T_MODE1_CONTRACT...
prompt Table is empty
prompt Loading T_MODE1_EMPLOYEE...
prompt Table is empty
prompt Loading T_MODE1_RECORD...
prompt Table is empty
prompt Loading T_MODE1_REWARD...
prompt Table is empty
prompt Loading t_mode1_achive...
prompt Table is empty
prompt Loading t_mode1_employee...
