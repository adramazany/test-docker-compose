/**********************************************************************************************
***                                 DataBase   Structure                            ***
***********************************************************************************************/
--ALTER SESSION SET CONTAINER=XEPDB1;
--CREATE USER TEST IDENTIFIED BY test QUOTA UNLIMITED ON USERS;
--GRANT CONNECT, RESOURCE TO TEST;

CREATE USER saba IDENTIFIED BY saba QUOTA UNLIMITED ON USERS;

grant connect,resource to saba;

-- Now switch to newly created user
CONNECT saba/saba

/**                            A-   Base Tables   v2                                 **
 **                                                                                  **/

/****************************  0- app_staus_field   **************************************/

CREATE TABLE app_staus_field (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(255)   NOT NULL ,
code  NUMBER(11,0) NOT NULL ,
PRIMARY KEY (id)
);
 insert into app_staus_field values (1,'فعال',1);
 insert into app_staus_field values (2,'غیر فعال',2);

/****************************  1- bt_audiences  **************************************/

CREATE TABLE bt_audiences (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)  NOT NULL ,
PRIMARY KEY (id)
);

/****************************  2- bt_authorities  **************************************/

CREATE TABLE bt_authorities (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);

/****************************  3- bt_classification      **************************************/
CREATE TABLE bt_classification (
id  NUMBER(11,0) NOT NULL  ,
name  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);

/****************************  4- bt_condition           **************************************/

CREATE TABLE bt_condition  (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
is_approve  NUMBER(1,0) DEFAULT NULL ,
is_section  NUMBER(1,0) DEFAULT NULL ,
color  VARCHAR2(20)   DEFAULT NULL ,
PRIMARY KEY (id)
);

 insert into bt_condition values (1 ,'معتبر'   ,1,1,'#100e0e');
 insert into bt_condition values (2 ,'منسوخ'   ,1,0,'#e22107');
 insert into bt_condition values (11,'اصلاح شده',0,1,'#44c515');
 insert into bt_condition values (12,'تکمیلی'  ,1,0,'#1b53a2');

/****************************  5- bt_headquarters_office **************************************/

CREATE TABLE bt_headquarters_office (
id  NUMBER(11,0) NOT NULL  ,
office_name  VARCHAR2(70)   NOT NULL ,
indication_code  NUMBER(11,0) NOT NULL ,
status   NUMBER(1,0) NOT NULL ,
past_code  NUMBER(11,0) DEFAULT NULL ,
date_e VARCHAR2(10)   DEFAULT NULL ,
CONSTRAINT  HEADQUART_APPSTATUS_FK   FOREIGN KEY (STATUS)   REFERENCES app_staus_field(id) ,
PRIMARY KEY (id)
);


/****************************  6- bt_immediate           **************************************/

CREATE TABLE bt_immediate (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);

/****************************  7- bt_review_comments     **************************************/
CREATE TABLE bt_review_comments (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);

/****************************  8- bt_role_users          **************************************/

CREATE TABLE bt_role_users (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
role_name  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);
 insert into bt_role_users values (1,'admin','مدیر');
/****************************  9- bt_topic              **************************************/

CREATE TABLE bt_topic  (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(150)  ,
code  VARCHAR2(20)  ,
f_parent  NUMBER(11,0) ,
hierarchy  VARCHAR2(200)   ,
treeOrder  NUMBER(11,8)  ,
PRIMARY KEY (id)
);
insert into  bt_topic  values (1,'طرح های سپرده ای','',0,'.',1);
insert into  bt_topic  values (2,'شناسایی مشتری','',0,'.',2);
insert into  bt_topic  values (3,'سپرده های  ریالی','',0,'.',3);
insert into  bt_topic  values (4,'سپرده های ارزی','',0,'.',4);
insert into  bt_topic  values (5,'خدمات بانکی حضوری','',0,'.',5);
insert into  bt_topic  values (6,'خدمات بانکی غیر حضوری','',0,'.',6);
insert into  bt_topic  values (7,'خدمات بانکی ارزی','',0,'.',7);
insert into  bt_topic  values (8,'تسهیلات (ریالی - ارزی)','',0,'.',8);
insert into  bt_topic  values (9,'ضمانت نامه (ریالی - ارزی)','',0,'.',9);
insert into  bt_topic  values (10,'پیگیری و وصول مطالبات','',0,'.',10);
insert into  bt_topic  values (11,'دستورالعمل های نظارتی و امنیتی','',0,'.',11);
insert into  bt_topic  values (12,'دستورالعمل های منابع انسانی (رفاهی - آموزشی - پرسنلی)','',0,'.',12);
insert into  bt_topic  values (13,'دستورالعمل های مالی','',0,'.',13);
insert into  bt_topic  values (14,'شبکه شعب','',0,'.',14);


/****************************  10- bt_tree_structure     **************************************/

CREATE TABLE bt_tree_structure (
id  NUMBER(11,0) NOT NULL  ,
title  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);



/****************************  11- bt_type               **************************************/

CREATE TABLE bt_type (
id  NUMBER(11,0) NOT NULL  ,
type_code  NUMBER(11,0) NOT NULL ,
type_title  VARCHAR2(50)   NOT NULL ,
PRIMARY KEY (id)
);



/****************************  12- bt_words_tree         **************************************/

CREATE TABLE bt_words_tree (
id  NUMBER(11,0) NOT NULL  ,
type_words  VARCHAR2(50)   NOT NULL ,
words_list  CLOB   NOT NULL ,
PRIMARY KEY (id)
);

/**                            B -   All Other Tables                                      **
**                                                                                 **/



/****************************  1- approvals          **************************************/
CREATE TABLE approvals (
id  NUMBER(11,0) NOT NULL  ,
f_type_circulars  NUMBER(6,0) NOT NULL ,
title  VARCHAR2(1000)   DEFAULT NULL ,
notification_number  VARCHAR2(12)   NOT NULL ,
notification_date  VARCHAR2(10)   NOT NULL ,
f_authorities  NUMBER(6,0) DEFAULT NULL ,
approval_date  VARCHAR2(10)   DEFAULT NULL ,
f_condition  NUMBER(6,0) DEFAULT NULL ,
background_record  NUMBER(11,0) DEFAULT NULL ,
runtime  VARCHAR2(10)   DEFAULT NULL ,
validity_date  VARCHAR2(10)   DEFAULT NULL ,
f_headquarters  NUMBER(6,0) DEFAULT NULL ,
indicator_number_1  VARCHAR2(10)   DEFAULT NULL ,
indicator_number_2  VARCHAR2(10)   DEFAULT NULL ,
f_classification  NUMBER(6,0) DEFAULT NULL ,
f_immediate  NUMBER(6,0) DEFAULT NULL ,
description  VARCHAR2(2000)   DEFAULT NULL ,
last_changes  VARCHAR2(10)   DEFAULT NULL ,
last_modify  VARCHAR2(25)   DEFAULT NULL ,
last_version  NUMBER(1) DEFAULT NULL ,
CONSTRAINT  APPROVAL_BTTYPE_FK   FOREIGN KEY (f_type_circulars)	REFERENCES bt_type(id),
CONSTRAINT  APPROVAL_AUTHOR_FK   FOREIGN KEY (f_authorities)	REFERENCES bt_authorities(id),
CONSTRAINT  APPROVAL_CONDIT_FK   FOREIGN KEY (f_condition)	    REFERENCES bt_condition(id),
CONSTRAINT  APPROVAL_HEADQU_FK   FOREIGN KEY (f_headquarters)	REFERENCES bt_headquarters_office(id),
CONSTRAINT  APPROVAL_CLASSI_FK   FOREIGN KEY (f_classification)	REFERENCES bt_classification(id),
CONSTRAINT  APPROVAL_IMMEDI_FK   FOREIGN KEY (f_immediate)	    REFERENCES bt_immediate(id),
PRIMARY KEY (id)
);

/****************************  2- section            **************************************/

CREATE TABLE section (
id  NUMBER(11,0) NOT NULL  ,
f_approval  NUMBER(11,0) NOT NULL ,
tree_order  NUMBER(14,8) DEFAULT NULL ,
f_section_type  NUMBER(11,0) NOT NULL ,
section_order  VARCHAR2(40)   DEFAULT NULL ,
f_parent  NUMBER(11,0) DEFAULT NULL ,
hierarchy  VARCHAR2(250)   NOT NULL ,
title  VARCHAR2(2000)   DEFAULT NULL ,
body  CLOB   NULL ,
f_condition  NUMBER(11,0) NOT NULL ,
CONSTRAINT  SECTION_APPROVAL_FK    FOREIGN KEY (f_approval)     REFERENCES approvals(id),
CONSTRAINT  SECTION_BT_TREE_FK     FOREIGN KEY (f_section_type) REFERENCES bt_tree_structure(id),
CONSTRAINT  SECTION_CONDITION_FK   FOREIGN KEY (f_condition)    REFERENCES bt_condition(id),
PRIMARY KEY (id)
);




/****************************  3- attachments        **************************************/

CREATE TABLE attachments (
id  NUMBER(11,0) NOT NULL  ,
f_approval  NUMBER(11,0) DEFAULT NULL ,
file_name  VARCHAR2(80)   NOT NULL ,
content  BLOB DEFAULT NULL ,
file_format  VARCHAR2(30)   DEFAULT NULL ,
description  VARCHAR2(200)   DEFAULT NULL ,
date_create  VARCHAR2(30)   DEFAULT NULL ,
PRIMARY KEY (id)
);



/****************************  4- audiences          **************************************/

CREATE TABLE audiences (
id  NUMBER(11,0) NOT NULL  ,
f_approval  NUMBER(11,0) NOT NULL ,
f_audiences  NUMBER(5,0) DEFAULT NULL ,
role  NUMBER(5,0) DEFAULT NULL ,
PRIMARY KEY (id),
CONSTRAINT uk_approval_audiences unique (f_approval, f_audiences),
CONSTRAINT  AUDIENCES_BTAUDIENC_FK   FOREIGN KEY (F_AUDIENCES)	    REFERENCES bt_audiences(id),
CONSTRAINT  AUDIENCES_APPROVAL_FK    FOREIGN KEY (f_approval)	    REFERENCES approvals(id)
);



/****************************  5- effect             **************************************/

CREATE TABLE effect (
id  NUMBER(11,0) NOT NULL  ,
f_approval  NUMBER(11,0) NOT NULL ,
f_section  NUMBER(11,0) DEFAULT NULL ,
f_type  VARCHAR2(30)   DEFAULT NULL ,
notification_number  VARCHAR2(20)   DEFAULT NULL ,
notification_date  VARCHAR2(10)   DEFAULT NULL ,
title  VARCHAR2(200)   DEFAULT NULL ,
f_headquarter  VARCHAR2(50)   DEFAULT NULL ,
approval_effective  NUMBER(11,0) DEFAULT NULL ,
section_effective  NUMBER(11,0) DEFAULT NULL ,
description  VARCHAR2(800)   DEFAULT NULL ,
CONSTRAINT  EFFECT_APPROVAL_FK   FOREIGN KEY (f_approval) REFERENCES approvals(id),
CONSTRAINT  EFFECT_SECTION_FK    FOREIGN KEY (f_section)  REFERENCES section(id),
PRIMARY KEY (id)
);



/****************************  6- reference          **************************************/

CREATE TABLE reference (
id  NUMBER(11,0) NOT NULL  ,
f_approval  NUMBER(11,0) NOT NULL ,
f_section  NUMBER(11,0) DEFAULT NULL ,
f_type  VARCHAR2(30)   DEFAULT NULL ,
notification_number  VARCHAR2(20)   DEFAULT NULL ,
notification_date  VARCHAR2(10)   DEFAULT NULL ,
title  VARCHAR2(200)   DEFAULT NULL ,
f_headquarter  VARCHAR2(50)   DEFAULT NULL ,
approval_source  NUMBER(11,0) DEFAULT NULL ,
section_source  NUMBER(11,0) DEFAULT NULL ,
description  VARCHAR2(800)   DEFAULT NULL ,
CONSTRAINT  REFERENCE_APPROVAL_FK   FOREIGN KEY (f_approval) REFERENCES approvals(id),
CONSTRAINT  REFERENCE_SECTION_FK    FOREIGN KEY (f_section)  REFERENCES section(id),
/*CONSTRAINT uk_notification_number unique (notification_number),*/
PRIMARY KEY (id)
);



/****************************  7- topics             **************************************/

CREATE TABLE topics (
topics_id  NUMBER(11,0) NOT NULL  ,
f_topic  NUMBER(11,0) NOT NULL ,
f_approval  NUMBER(11,0) NOT NULL ,
f_section  NUMBER(11,0) DEFAULT NULL ,
PRIMARY KEY (topics_id)
);




/****************************  8- users              **************************************/

CREATE TABLE users (
id  NUMBER(11,0) NOT NULL  ,
name  VARCHAR2(30)   DEFAULT NULL ,
family  VARCHAR2(30)   DEFAULT NULL ,
pass  VARCHAR2(10)   DEFAULT NULL ,
personnel_id  VARCHAR2(10)   NOT NULL ,
national_number  VARCHAR2(10)   DEFAULT NULL ,
description  VARCHAR2(200)   DEFAULT NULL ,
userid  NUMBER(11,0) DEFAULT NULL ,
PRIMARY KEY (id)
);
insert into  users  values (1,'admin','admin','admin','admin','11223344','','');

/****************************  9- users_role         **************************************/

CREATE TABLE users_role (
id  NUMBER(11,0) NOT NULL  ,
userid  NUMBER(11,0) NOT NULL ,
roleid  NUMBER(11,0) NOT NULL ,
CONSTRAINT  USERSROLE_BT_ROL_FK   FOREIGN KEY (roleid)    REFERENCES bt_role_users(id),
PRIMARY KEY (id)
);
insert into users_role  values (1,1,1);
/****************************  10- HIBERNATE_SEQUENCE         **************************************/

create sequence HIBERNATE_SEQUENCE;
/*******************      1397- 05 - 16   [ 15:20]    ******************************************/

create view vw_add_child_section_require as
SELECT parent.f_approval
  ,parent.id AS f_parent
  ,(parent.hierarchy||parent.id||'.') AS hierarchy
  ,((NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (parent.hierarchy||parent.id||'.%'))
         ),parent.tree_order)
  + NVL((SELECT MIN(parent_next.tree_order) FROM section parent_next WHERE ((parent_next.f_approval = parent.f_approval)
          AND (parent_next.tree_order > NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (parent.hierarchy||parent.id||'.%'))
                                            ),parent.tree_order)))
        ),(parent.tree_order + 2))) / 2) AS tree_order
  ,last_sibling.f_section_type
  ,last_sibling.section_order
  ,last_sibling.f_condition
FROM section parent
left join (SELECT last_sibling.*, ROW_NUMBER() OVER (PARTITION BY f_approval,f_parent ORDER BY last_sibling.tree_order DESC) AS rn FROM section last_sibling
          ) last_sibling on (last_sibling.f_approval = parent.f_approval AND last_sibling.f_parent = parent.id AND rn = 1)
;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create view vw_add_root_section_require as
SELECT a.id AS f_approval,
  0         AS f_parent,
  '.'       AS hierarchy,
  (SELECT (NVL(MAX(s.tree_order),0) + 1) FROM section s WHERE (s.f_approval = a.id)
  )   AS tree_order,
  1   AS f_section_type,
  '1' AS section_order,
  1   AS f_condition
FROM approvals a ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

create view vw_approval_section_topics as
SELECT NVL(ts.topics_id,0) AS id,
  t.id                 AS f_topic,
  ts.f_approval        AS f_approval,
  ts.f_section         AS f_section,
  t.title              AS title,
  t.code               AS code,
  t.f_parent           AS f_parent,
  t.hierarchy          AS hierarchy,
  t.treeOrder          AS treeOrder
FROM (bt_topic t
LEFT JOIN topics ts
ON((t.id = ts.f_topic)))
ORDER BY t.treeOrder;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

create view vw_approval_headqarter as
select approvals.id AS f_approval,
       approvals.title AS approval_title,
	   bt_condition.id AS condition_id,
	   bt_condition.color AS condition_color,
	   bt_condition.title AS condition_title,
	   bt_headquarters_office.id AS headquarter_id,
	   bt_headquarters_office.office_name AS office_name,
	   bt_headquarters_office.indication_code AS indication_code,
	   bt_headquarters_office.past_code AS past_code,
	   bt_type.id AS type_id,bt_type.type_title AS type_title
    from (((approvals join bt_headquarters_office on((approvals.f_headquarters = bt_headquarters_office.id)))
	                  join bt_condition on((approvals.f_condition = bt_condition.id)))
					  join bt_type on((approvals.f_type_circulars = bt_type.id)))
	order by approvals.id ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE VIEW vw_master_effect AS
select a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,
cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,
a.notification_number AS notification_number from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
exists(select 1 AS Not_used from effect where (effect.approval_effective = a.id))))) order by a.notification_date desc ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE VIEW vw_slave_effect AS
select a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,a.notification_number AS notification_number
from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
 exists(select 1 AS Not_used from effect
 where (effect.f_approval = a.id))))) order by a.notification_date desc ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE VIEW vw_sourcs_reference AS
select a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,a.notification_number AS notification_number
from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
exists(select id AS refer_id
from reference where (reference.approval_source = a.id)))))
order by a.notification_date desc ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



/* *****************************  new    *****************************************************************
****                          اخرین تغییرات برای اعمال بر روی سرور                                   ****
******************************  new    *****************************************************************/
/* *****************************  1397-05-23 [20:15]   *****************************************************************/
insert into  bt_topic  values (1,'طرح های سپرده ای','1',0,'.',1);
insert into  bt_topic  values (2,'شناسایی مشتری','2',0,'.',2);
insert into  bt_topic  values (3,'سپرده های  ریالی','3',0,'.',3);
insert into  bt_topic  values (4,'سپرده های ارزی','4',0,'.',4);
insert into  bt_topic  values (5,'خدمات بانکی حضوری','5',0,'.',5);
insert into  bt_topic  values (6,'خدمات بانکی غیر حضوری','6',0,'.',6);
insert into  bt_topic  values (7,'خدمات بانکی ارزی','7',0,'.',7);
insert into  bt_topic  values (8,'تسهیلات (ریالی - ارزی)','8',0,'.',8);
insert into  bt_topic  values (9,'ضمانت نامه (ریالی - ارزی)','9',0,'.',9);
insert into  bt_topic  values (10,'پیگیری و وصول مطالبات','10',0,'.',10);
insert into  bt_topic  values (11,'دستورالعمل های نظارتی و امنیتی','11',0,'.',11);
insert into  bt_topic  values (12,'دستورالعمل های منابع انسانی (رفاهی - آموزشی - پرسنلی)','12',0,'.',12);
insert into  bt_topic  values (13,'دستورالعمل های مالی','13',0,'.',13);
insert into  bt_topic  values (14,'شبکه شعب','14',0,'.',14);

/*
ALTER TABLE APPROVALS ADD CONSTRAINT UK_NOTIFICATION_NUMBER UNIQUE
(  NOTIFICATION_NUMBER )ENABLE;
*/

ALTER TABLE BT_HEADQUARTERS_OFFICE
MODIFY (OFFICE_NAME VARCHAR2(200 BYTE) );

ALTER TABLE ATTACHMENTS
MODIFY (FILE_FORMAT VARCHAR2(150 BYTE) );

ALTER TABLE BT_AUDIENCES ADD CONSTRAINT UK_BT_AUDIENCES UNIQUE (  TITLE )ENABLE;




/* connect sys as sysdba */
grant select on sys.v_$locked_object to saba;
grant select on sys.v_$session to saba;
grant select on dba_objects  to saba;
grant alter system to saba;



/*connect Saba */
create or replace procedure sp_kill_all_inactive_locks is
begin
  -- set serveroutput on
  --grant select on sys.v_$locked_object to saba;
  --grant select on sys.v_$session to saba;
  --grant select on dba_objects  to saba;
  --grant alter system to saba;
  for s in (select distinct c.owner,/*c.object_name,*/c.object_type,b.sid,b.serial#,b.status,b.osuser,b.machine
            from v$locked_object a ,v$session b,dba_objects c
            where b.sid = a.session_id and a.object_id = c.object_id and b.status='INACTIVE' and owner='SABA') loop
      dbms_output.put_line('SID='||s.sid||',SERIALl#='||s.serial#);
      execute immediate 'alter system kill session '''||s.sid||','||s.serial#||'''';
  end loop;
end;

/* ****                       1397-05-28             *** */
ALTER TABLE APPROVALS
ADD (F_STATUS NUMBER(2) DEFAULT NULL );

CREATE OR REPLACE VIEW VW_APPROVAL_HEADQARTER
AS select approvals.id AS f_approval,
       approvals.title AS approval_title,
       approvals.f_status AS status,
	   bt_condition.id AS condition_id,
	   bt_condition.color AS condition_color,
	   bt_condition.title AS condition_title,
	   bt_headquarters_office.id AS headquarter_id,
	   bt_headquarters_office.office_name AS office_name,
	   bt_headquarters_office.indication_code AS indication_code,
	   bt_headquarters_office.past_code AS past_code,
	   bt_type.id AS type_id,bt_type.type_title AS type_title
from (((approvals join bt_headquarters_office on((approvals.f_headquarters = bt_headquarters_office.id))) join bt_condition on((approvals.f_condition = bt_condition.id))) join bt_type on((approvals.f_type_circulars = bt_type.id))) order by approvals.id;


CREATE OR REPLACE VIEW VW_MASTER_EFFECT
AS select a.f_status As status,a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,
cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,
a.notification_number AS notification_number from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
exists(select 1 AS Not_used from effect where (effect.approval_effective = a.id))))) order by a.notification_date desc;


CREATE OR REPLACE VIEW VW_SLAVE_EFFECT
AS select a.f_status As status,a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,a.notification_number AS notification_number
from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
 exists(select 1 AS Not_used from effect
 where (effect.f_approval = a.id))))) order by a.notification_date desc;


 CREATE OR REPLACE VIEW VW_SOURCS_REFERENCE
AS select a.f_status As status,a.id AS id,a.title AS title,ty.id AS type_id,ty.type_title AS type_title,cond.id AS condition_id,cond.title AS condition_title,a.notification_date AS notification_date,a.notification_number AS notification_number
from ((approvals a
join bt_type ty on((ty.id = a.f_type_circulars)))
join bt_condition cond on(((cond.id = a.f_condition) and
exists(select id AS refer_id
from reference where (reference.approval_source = a.id)))))
order by a.notification_date desc;

/* ***********************************************************************
****         اخرین تغییرات برای اعمال بر روی سرور                     ****
*************************************************************************/
/* ***************  1397-06-15 [14:20]   ********************************/
CREATE OR REPLACE VIEW VW_APPROVAL_HEADQARTER
AS select approvals.id AS f_approval,
       approvals.title AS approval_title,
       approvals.f_status AS status,
       approvals.notification_number as notification_number ,
       approvals.notification_date   as notification_date ,
	   bt_condition.id AS condition_id,
	   bt_condition.color AS condition_color,
	   bt_condition.title AS condition_title,
	   bt_headquarters_office.id AS headquarter_id,
	   bt_headquarters_office.office_name AS office_name,
	   bt_headquarters_office.indication_code AS indication_code,
	   bt_headquarters_office.past_code AS past_code,
	   bt_type.id AS type_id,bt_type.type_title AS type_title
from (((approvals join bt_headquarters_office on((approvals.f_headquarters = bt_headquarters_office.id))) join bt_condition on((approvals.f_condition = bt_condition.id))) join bt_type on((approvals.f_type_circulars = bt_type.id))) order by approvals.id;
/* ***********************************************************************
****         اخرین تغییرات برای اعمال بر روی سرور                     ****
****                      سبا نسخه دو                                 ****
*************************************************************************/
/* ***************  1397-07-26 [14:45]   ********************************/

ALTER TABLE USERS
ADD (OFFICE_LOCATION VARCHAR2(100) );

ALTER TABLE BT_REVIEW_COMMENTS
ADD (TYPE NUMBER(2) );

+++++

CREATE TABLE USER_COMMENTS
(
  ID NUMBER(11) NOT NULL
, F_USERID NUMBER(11)
, DATE_C VARCHAR2(10)
, F_APPROVAL NUMBER(11)
, BODY_TXT VARCHAR2(600)
, F_CONFIRM NUMBER(2)
, F_TYPE    NUMBER(2)
, TIME_C    VARCHAR2(15)
, RELATED_NUMBER  NUMBER(11)
, ROL    NUMBER(2)
, CONSTRAINT USER_COMMENTS_PK PRIMARY KEY
  (
    ID
  )
  ENABLE
);


+++++++++

insert into  bt_review_comments  values (1,'نظر کاربران',1);
insert into  bt_review_comments  values (2,'پاسخ کاربران',1);
insert into  bt_review_comments  values (5,'ثبت اولیه',2);
insert into  bt_review_comments  values (6,'مجاز به نشر',2);
insert into  bt_review_comments  values (7,'بایگانی',2);

+++++++++++++++++++++++++++++++++++++++++++++++

create or replace view vw_add_child_section_require as
SELECT parent.f_approval
  ,parent.id AS f_parent
  ,(parent.hierarchy||parent.id||'.') AS hierarchy
  ,((NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (parent.hierarchy||parent.id||'.%'))
         ),parent.tree_order)
  + NVL((SELECT MIN(parent_next.tree_order) FROM section parent_next WHERE ((parent_next.f_approval = parent.f_approval)
          AND (parent_next.tree_order > NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (parent.hierarchy||parent.id||'.%'))
                                            ),parent.tree_order)))
        ),(NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (parent.hierarchy||parent.id||'.%'))),parent.tree_order) + 2))) / 2) AS tree_order
  ,last_sibling.f_section_type
  ,last_sibling.section_order
  ,last_sibling.f_condition
FROM section parent
left join (SELECT last_sibling.*, ROW_NUMBER() OVER (PARTITION BY f_approval,f_parent ORDER BY last_sibling.tree_order DESC) AS rn FROM section last_sibling
          ) last_sibling on (last_sibling.f_approval = parent.f_approval AND last_sibling.f_parent = parent.id AND rn = 1)
;


***************************************************************************************************************
***
CREATE TABLE APPROVAL_COMMENT_COUNT
(
  ID NUMBER NOT NULL
, F_APPROVAL NUMBER
, TOTAL_COMMENT NUMBER
, PUBLISHED_COMMENT NUMBER
, ARCHIVE_COMMENT NUMBER
, RESPONSE NUMBER
, CONSTRAINT APPROVALCOMMENTCOUNT_PK PRIMARY KEY
  (
    ID
  )
  ENABLE
);


/*************************************************************
  970922-saba-change(Soori)
 */
create sequence seq_operationlog;

create table operationlog (
  id int not null primary key
  ,username varchar(100) not null
  ,log_date date default SYSDATE not null
  ,page varchar(100) not null
  ,operation varchar(100) not null
  ,reference varchar(250)
  ,info varchar(4000)
);
comment on column operationlog.page is 'ex:صفحه ورود|صفحه اصلی|جستجوی ساده|صندوق ایمیل|کاربر|پروفایل آدرس ایمیل|گراف|گراف|صندوق ایمیل';
comment on column operationlog.operation is 'ex:ورود|خروج|جستجو|نمایش|ذخیره|نمایش|نمایش|افزودن سطح اول|فیلتر';
comment on column operationlog.reference is 'ex:admin|admin|Hi|sepehr@bip.com|admin|sepehr@bip.com|sepehr@bip.com|saman@bip.com|saman@bip.com';
comment on column operationlog.info is 'ex:|||||||{نام از علی به حسن}|{از تاریخ:1396,تاتاریخ:1397}';


create table user_note(
   id int primary key
   ,F_userid int
  ,F_APPROVAL int
  ,F_section int
  ,DATE_create VARCHAR2(10)
  ,TIME_create    VARCHAR2(15)
  ,title varchar2(200)
  ,body varchar2(1000)
  ,type number(1)
  ,active number(1)
  ,constraint fk_user_note_users foreign key (F_userid) references users(id)
  ,constraint fk_user_note_approvals foreign key (F_APPROVAL) references approvals(id)
  ,constraint fk_user_note_section foreign key (F_section) references section(id)
);
comment on column user_note.type is '0:یادداشت روی مصوبه . 1: یادداشت شخصی';
comment on column user_note.active is '0: فعال , 1: غیر فعال';

create table notify(
  id int not null primary key
  ,send_date date not null
  ,send_userid int
  ,receive_userid int
  ,read_date date
  ,subject varchar2(1000)
  ,body clob
  ,constraint fk_notify_users_send foreign key (send_userid) references users(id)
  ,constraint fk_notify_users_receive foreign key (receive_userid) references users(id)
);

alter table notify add (
  forward_notifyid int
  ,reply_notifyid int
  ,constraint fk_notify_notify_forward foreign key (forward_notifyid) references notify(id)
  ,constraint fk_notify_notify_reply foreign key (reply_notifyid) references notify(id)
);
comment on column notify.forward_notifyid is 'old notify id that forward current';
comment on column notify.reply_notifyid is 'old notify id that replied with current';

alter table notify add (
  f_approval int
  ,constraint fk_notify_approvals foreign key (f_approval) references approvals(id)
);

CREATE UNIQUE INDEX UK_PERSONNEL_ID ON USERS (PERSONNEL_ID ASC);

ALTER TABLE NOTIFY
MODIFY (send_date DEFAULT sysdate );

ALTER TABLE USERS_ROLE
ADD CONSTRAINT UK_ROLEID_USERID UNIQUE
(
  USERID
, ROLEID
)
ENABLE;


insert into bt_role_users values (2,'public relation','روابط عمومی');
insert into bt_role_users values (2,'data entry','ورود اطلاعات');
insert into bt_role_users values (2,'user','کاربر');


insert into BT_WORDS_TREE values (1,'مترادف','،قرارداد،معاهده،پیمان نامه،');



CREATE INDEX ft_approvals_title ON approvals(title) INDEXTYPE IS CTXSYS.CONTEXT;
CREATE INDEX ft_section_body ON section(body) INDEXTYPE IS CTXSYS.CONTEXT;


drop index ft_approvals_title ;
create index ft_approvals_title on approvals(title) indextype is ctxsys.context parameters ('sync (on commit)');
drop index ft_section_body ;
create index ft_section_body on section(body) indextype is ctxsys.context parameters ('sync (on commit)');


/* ************************* 97/10/02 ***************** */

/*
CREATE OR REPLACE VIEW VW_statistics_Notices as
select a.id,a.title,a.NOTIFICATION_NUMBER,bt.type_title,f.count ,f.send_date,
 f.read_user_count
 from (
select COUNT(n.id) count,n.send_date,n.f_approval,
(select count(*) from notify n1 where read_date is not null and n1.f_approval = n.f_approval
and n1.send_date = n.send_date) as read_user_count
from notify n
group by n.send_date,n.f_approval
)f
join approvals a on f.f_approval = a.id
join bt_type bt on bt.id = a.f_type_circulars; */


/* ************  97/10/03 ********************** */


ALTER TABLE USERS
ADD CONSTRAINT uk_PERSONNEL_ID UNIQUE
(
  PERSONNEL_ID
)
USING INDEX UK_PERSONNEL_ID
ENABLE;

ALTER TABLE USERS
ADD CONSTRAINT uk_NATIONAL_NUMBER UNIQUE
(
  NATIONAL_NUMBER
)
ENABLE;

ALTER TABLE USERS
ADD CONSTRAINT uk_USERID UNIQUE
(
  USERID
)
ENABLE;

/* ************ 97/100/06 ********************* */
create table Structure(
   id int primary key
  ,title    VARCHAR2(500)
);



create table Structure_element(
   id int primary key
   ,f_structure int
   ,f_section_type int
  ,haslabel number(1)
  ,numbering_method number(1)
  ,skippable    number(1)
  ,f_parent int
  ,tree_order  NUMBER(14,8)
  ,constraint fk_Structure_el_TREE_STRUC foreign key (f_section_type) references BT_TREE_STRUCTURE(id)
  ,constraint fk_Structure_el_Structure foreign key (f_structure) references structure(id)
  ,constraint fk_Structure_el_Structure_el foreign key (f_parent) references Structure_element(id)
);


/* ****************** character ********************* */

update approvals set title=replace(title,CHR(55690),CHR(56204));
update section set body=replace(body,CHR(55690),CHR(56204));

update approvals set title=replace(title,CHR(55683),CHR(55977));
update section set body=replace(body,CHR(55683),CHR(55977));

commit;

/* **************    97/10/09 ************** */

create table bookmark_approval(
   id int primary key
   ,f_user int
   ,f_approval int
  ,constraint fk_bookmark_approval_users foreign key (f_user) references users(id)
  ,constraint fk_bookmark_approval_approvals foreign key (f_approval) references approvals(id)
  ,CONSTRAINT UK_USER_APPROVAL UNIQUE(F_USER, F_APPROVAL)
);
/* **************    97/10/19 ************** */
alter table users add (
  office_id int
);
/* **************    97/10/20 ************** */

update section set F_PARENT = null where F_PARENT = 0;
update topics set F_section = null where F_section = 0;
commit;

/* ******** approvals **************** */
alter table approvals add (
  CONSTRAINT  approval_status_F_STATUS_FK   FOREIGN KEY (f_status) REFERENCES APP_STAUS_FIELD(id)
);

/* ******** attachment **************** */

alter table attachments add (
  CONSTRAINT  attachments_approvals_f_APP_FK   FOREIGN KEY (f_approval) REFERENCES approvals(id)
);


/* ******** topics **************** */

alter table topics add (
  CONSTRAINT  topics_approval_f_approval_FK   FOREIGN KEY (f_approval) REFERENCES approvals(id),
  CONSTRAINT  topics_bt_topic_F_TOPIC_FK   FOREIGN KEY (F_TOPIC) REFERENCES bt_topic(id)
);

alter table topics add (
  CONSTRAINT  topics_approval_f_section_FK   FOREIGN KEY (f_section) REFERENCES section(id)
);

/* ******** USER_COMMENTS **************** */

alter table USER_COMMENTS add (
  CONSTRAINT  USER_COMMENTS_users_USERID_FK   FOREIGN KEY (F_USERID) REFERENCES users(id),
  CONSTRAINT  USER_COM_BT_REVIEW_COM_TYPE_FK   FOREIGN KEY (F_TYPE) REFERENCES BT_REVIEW_COMMENTS(id),
  CONSTRAINT  USER_COM_BT_REVIEW_CONFIRM_FK   FOREIGN KEY (F_CONFIRM) REFERENCES BT_REVIEW_COMMENTS(id)
);
/* ******** section **************** */

alter table section add (
  CONSTRAINT  section_section_f_parent_FK   FOREIGN KEY (f_parent) REFERENCES section(id)
);






















create or replace procedure sp_kill_all_inactive_locks is
begin
  -- set serveroutput on
  --grant select on sys.v_$locked_object to saba;
  --grant select on sys.v_$session to saba;
  --grant select on dba_objects  to saba;
  --grant alter system to saba;
  for s in (select distinct c.owner,/*c.object_name,*/c.object_type,b.sid,b.serial#,b.status,b.osuser,b.machine
            from v$locked_object a ,v$session b,dba_objects c
            where b.sid = a.session_id and a.object_id = c.object_id and b.status='INACTIVE' and owner='SABA') loop
      dbms_output.put_line('SID='||s.sid||',SERIALl#='||s.serial#);
      execute immediate 'alter system kill session '''||s.sid||','||s.serial#||'''';
  end loop;
end;

/* connect sys as sysdba */
grant select on sys.v_$locked_object to saba;
grant select on sys.v_$session to saba;
grant select on dba_objects  to saba;
grant alter system to saba;





/****************************************************************************
971020 -
 */


CREATE OR REPLACE FORCE VIEW VW_TRANSFER_SECTION_REQUIRE ("ID", "F_APPROVAL", "HIERARCHY", "F_PARENT", "TREE_ORDER", "NEXT_TREE_ORDER", "PREV_TREE_ORDER", "NEXT_SIBLING_TREE_ORDER", "LAST_CHILD_TREE_ORDER") AS
select target.id
  ,target.f_approval
  ,target.hierarchy
  ,target.f_parent
  ,target.tree_order
  ,target.next_tree_order
  ,target.prev_tree_order
  ,NVL(target.next_sibling_tree_order
    ,NVL((select min(target_next.tree_order) from section target_next where target_next.f_approval=target.f_approval and target_next.tree_order>target.last_child_tree_order),(target.last_child_tree_order+2)))
    as next_sibling_tree_order
  ,target.last_child_tree_order
from (
  select target.id
  ,target.f_approval
  ,target.hierarchy
  ,target.f_parent
  ,target.tree_order
  ,NVL((select min(target_next.tree_order) from section target_next where target_next.f_approval=target.f_approval and target_next.tree_order>target.tree_order),(target.tree_order+2)) as next_tree_order
  ,NVL((select max(target_prev.tree_order) from section target_prev where target_prev.f_approval=target.f_approval and target_prev.tree_order<target.tree_order),0) as prev_tree_order
  ,(select min(target_next_sibling.tree_order) from section target_next_sibling where nvl(target_next_sibling.f_parent,0)=nvl(target.f_parent,0) and target_next_sibling.tree_order>target.tree_order) as next_sibling_tree_order
  ,NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (target.hierarchy||target.id||'.%'))),target.tree_order) last_child_tree_order
from section target
)target
order by target.tree_order;





alter table approvals drop constraint UK_NOTIFICATION_NUMBER;
DROP INDEX UK_NOTIFICATION_NUMBER;
create unique index UK_NOTIFICATION_NUMBER on approvals
          (case when BACKGROUND_RECORD is null then NOTIFICATION_NUMBER
            else NOTIFICATION_NUMBER||LAST_CHANGES||LAST_MODIFY end );


  CREATE OR REPLACE FORCE VIEW "SABA2"."VW_ADD_ROOT_SECTION_REQUIRE" ("F_APPROVAL", "F_PARENT", "HIERARCHY", "TREE_ORDER", "F_SECTION_TYPE", "SECTION_ORDER", "F_CONDITION") AS
  SELECT a.id AS f_approval,
  null         AS f_parent,
  '.'       AS hierarchy,
  (SELECT (NVL(MAX(s.tree_order),0) + 1) FROM section s WHERE (s.f_approval = a.id)
  )   AS tree_order,
  1   AS f_section_type,
  '1' AS section_order,
  1   AS f_condition
FROM approvals a;





ALTER TABLE APPROVALS
MODIFY (NOTIFICATION_NUMBER VARCHAR2(20 BYTE) );





INSERT INTO BT_TREE_STRUCTURE (ID, TITLE) VALUES ('23', 'متن');


alter table approvals add(
f_user_creator integer
,f_user_modifier integer
,tmp_articleid integer
,CONSTRAINT  fk_approvals_user_creator  FOREIGN KEY (f_user_creator)   REFERENCES users(id)
,CONSTRAINT  fk_approvals_user_lastmodify  FOREIGN KEY (f_user_modifier)   REFERENCES users(id)
);



alter table bt_headquarters_office add (office_name_compress as (REGEXP_REPLACE(replace(replace(replace(upper(office_name),'ی','ي'),'ک','ك'),'آ','ا'), '[^آابپتثجچحخدذرزژسشصضطظعغفقكگلمنوهيءABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]+', '')));
create unique index ix_bt_headquarters_office on bt_headquarters_office( office_name_compress );
create sequence seq_headquarters;

/************************************************************************
convert old data
 ************************************************************************/

-- delete from approvals where TMP_ARTICLEID is not null;
-- delete from bt_headquarters_office where indication_code=-1;

create table tmp_headquarters as
select distinct IssuedPart as office_name ,REGEXP_REPLACE(replace(replace(replace(upper(ISSUEDPART),'ی','ي'),'ک','ك'),'آ','ا'), '[^آابپتثجچحخدذرزژسشصضطظعغفقكگلمنوهيءABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]+', '') as office_name_compress from t_articles where IssuedPart is not null
;

create table tmp_headquarters_unique as
select distinct office_name_compress,(select max(office_name) from tmp_headquarters hq2 where hq2.office_name_compress=hq.office_name_compress) as office_name from tmp_headquarters hq ;

insert into bt_headquarters_office (id,office_name,status,indication_code)
select seq_headquarters.nextval as id
,office_name
,1 as status
,-1 as indication_code
from tmp_headquarters_unique thq
where not exists (select * from bt_headquarters_office hq where hq.office_name_compress=thq.office_name_compress)
;

drop table tmp_headquarters;
drop table tmp_headquarters_unique;


create table tmp_approvals as select * from approvals where 1=0;

truncate table tmp_approvals;

insert into tmp_approvals
select hibernate_sequence.nextval as id
,(select typeid-1 from t_articlestype at where at.articleid=a.articleid) as f_type_circulars
,a.subject as title
,(select typeid-1 from t_articlestype at where at.articleid=a.articleid)||'/'||substr(a.ArticleDate,1,4)||'/'||a."NUMBER" as notification_number
,a.ReleaseDate as notification_date
,null as f_authorities
,a.ArticleDate as approval_date
,1 as f_condition
,null as background_record
,a.ArticleDate as runtime
,a.ExpiredDate as validity_date
,(select hq.id from bt_headquarters_office hq where hq.office_name_compress=REGEXP_REPLACE(replace(replace(replace(upper(a.issuedpart),'ی','ي'),'ک','ك'),'آ','ا'), '[^آابپتثجچحخدذرزژسشصضطظعغفقكگلمنوهيءABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]+', '')) as f_headquarters
,null as indicator_number_1
,null as indicator_number_2
,1 as f_classification
,1 as f_immediate
,'اطلاعات قدیمی:'
||decode(a.categoryid,null,'','گروه بندی='||(select ac.title from t_articlescategories ac where ac.categoryid=a.categoryid))
||decode(a.TimesViewed,null,'',',بازدید='||a.TimesViewed)
||decode(a.notice,null,'',',یادداشت='||a.notice)
||decode(a.title,null,'',',عنوان='||a.title)
as description
,a.AddedDate as last_changes
,to_char(sysdate,'YYYY/MM/DD HH24:MI:SS','nls_calendar=persian') as last_modify
,1 as last_version
,case a.Approved when 1 then 1 else 2 end as f_status
,1 as f_user_creator
,null as f_user_modifier
,a.articleid as tmp_articleid
from t_articles a
--where not exists(select * from approvals where approvals.TMP_ARTICLEID=a.articleid)
;


create table tmp_notification_number as
select rownum as background_record,t.* from (
select notification_number ,count(*) as total_count from tmp_approvals group by notification_number
having count(*)>1 )t
;

update tmp_approvals ta set background_record = (select background_record from tmp_notification_number tnn where tnn.notification_number=ta.notification_number)
where exists (select * from tmp_notification_number tnn where tnn.notification_number=ta.notification_number)
;

drop table tmp_notification_number;

begin
  for r in (select * from tmp_approvals ta where ta.BACKGROUND_RECORD IS NOT NULL) loop
    execute immediate 'update tmp_approvals set last_modify=to_char(systimestamp,''YYYY/MM/DD HH24:MI:SS.FF3'',''nls_calendar=persian'') where id='||r.id;
    dbms_lock.sleep( 0.1 );
  end loop;
end;

create unique index tmp_ix_1 on tmp_approvals (CASE    WHEN BACKGROUND_RECORD IS NULL THEN NOTIFICATION_NUMBER    ELSE NOTIFICATION_NUMBER || LAST_CHANGES || LAST_MODIFY  END);
drop index tmp_ix_1;

update tmp_approvals set last_version=0 where background_record is not null;

update tmp_approvals set last_version=1 where id in (select max(id) from tmp_approvals where background_record is not null group by background_record);

insert into approvals
select * from tmp_approvals
where not exists(select * from approvals where approvals.TMP_ARTICLEID=ta.tmp_articleid)
;

drop table tmp_approvals;



ALTER TABLE USERS  MODIFY (FAMILY VARCHAR2(70 BYTE) );

insert into users
select hibernate_sequence.nextval as ID
,tu.name as NAME
,tu.family as FAMILY
,tu.NATIONAL_NUMBER as PASS
,tu.PERSONNEL_ID as PERSONNEL_ID
,tu.NATIONAL_NUMBER as NATIONAL_NUMBER
,tu.DESCRIPTION as DESCRIPTION
,null as USERID
,tu.OFFICE_LOCATION as OFFICE_LOCATION
,tu.office_id as OFFICE_ID
from t_users tu;


insert into users_role
select hibernate_sequence.nextval as ID
,id as userid
,4 as roleid
from users where id>=77978;






/************************************************************************
971206-remove table from start of imported sections
 ************************************************************************/

select id
  ,substr(body,0,instr(body,'<table ')-1) || substr(body,instr(body,'</table>')+8) body
  from section
  where f_approval=64390 and f_section_type=1
  and instr(body,'<table ')>0 and instr(body,'</table>')>0
  ;

update section set body= substr(body,0,instr(body,'<table ')-1) || substr(body,instr(body,'</table>')+8)
  where instr(body,'<table ')>0 and instr(body,'</table>')>0
  and /*f_approval=64390 and */f_section_type=1
;

select id
  ,substr(body,0,instr(body,'<p dir="RTL" style="text-align: center;text-indent:-')-1) || substr(body,instr(body,'</p>') +4) body
from section
where instr(body,'<p dir="RTL" style="text-align: center;text-indent:-')>0 and instr(body,'</p>')>0
and f_approval=64390 and f_section_type=1
;

SET DEFINE OFF
;
select id
  ,replace(body,'<div>&nbsp;</div>','')
from section
where f_approval=64390 and f_section_type=1
;

update section set body= replace(body,'<div>&nbsp;</div>','')
  where /*f_approval=64390 and */f_section_type=1
;


/********************************************************************
    971207 - import office data
*********************************************************************/

  CREATE TABLE OFFICE
   (	"ID" NUMBER(12),
	"CODE" NUMBER,
	"NAME" VARCHAR2(255 BYTE),
	"PARENTID" NUMBER(*,0),
	"HIERARCHY" VARCHAR2(255 BYTE),
	 CONSTRAINT "PK_OFFICE" PRIMARY KEY ("ID"),
	 CONSTRAINT "UK_OFFICE_CODE" UNIQUE ("CODE"),
	 CONSTRAINT "FK_OFFICE_OFFICE" FOREIGN KEY ("PARENTID") REFERENCES "SABA2"."OFFICE" ("ID") ENABLE
   ) ;


insert into office (
select distinct management_code id,management_code code,ltrim(rtrim(management_name)) name,null as parentid,'.' hierarchy from tmp_branch
union all
select distinct region_code id,region_code code,ltrim(rtrim(region_name)) name,management_code as parentid,'.'||management_code||'.' hierarchy from tmp_branch
union all
select distinct branch_code id,branch_code code,ltrim(rtrim(branch_name)) name,region_code as parentid,'.'||management_code||'.'||region_code||'.' hierarchy from tmp_branch
)
;





insert into section
select Hibernate_sequence.nextval as ID
, (select id from approvals a where a.tmp_articleid=ta.articleid) as F_APPROVAL
, 10 as TREE_ORDER
, 1 as F_SECTION_TYPE
, null as SECTION_ORDER
, null as F_PARENT
, '.' as HIERARCHY
, null as TITLE
, ta.text as BODY
, 1 as F_CONDITION
from t_articles ta
left outer join approvals a on a.tmp_articleid=ta.articleid
where not exists (select * from section where section.f_approval=a.id)
;



update section set body= substr(body,0,instr(body,'<table ')-1) || substr(body,instr(body,'</table>')+8)
  where instr(body,'<table ')>0 and instr(body,'</table>')>0
  and /*f_approval=64390 and */f_section_type=1
  and exists (select * from approvals a where a.id=section.f_approval and a.VALIDITY_DATE is not null)
;

update section set body= replace(body,'<div>&nbsp;</div>','')
  where /*f_approval=64390 and */f_section_type=1
  and exists (select * from approvals a where a.id=section.f_approval and a.VALIDITY_DATE is not null)
;



/* ************ 97/12/08 *************** */
ALTER TABLE USERS
ADD (STATUS NUMBER(1) );
comment on column USERS.STATUS is '1:active user,2:inactive user';
update users set STATUS=1;

CREATE OR REPLACE VIEW VW_users AS select personnel_id as personnel_id,
id as id,
pass as pass
from users where STATUS = 1;

alter table users add (
constraint fk_users_office foreign key (office_id) references office(id)
);

/* ************ 97/12/09 *************** */

CREATE OR REPLACE VIEW VW_users_list AS
select u.id as id,u.name as name,u.FAMILY as FAMILY,u.PERSONNEL_ID as PERSONNEL_ID,
u.NATIONAL_NUMBER as NATIONAL_NUMBER,u.STATUS as STATUS,o.code as office_code,o.NAME as office_name,
ro.NAME as REGION_NAME,mo.NAME as MANAGEMENT_NAME,o.HIERARCHY||o.code||'.' as HIERARCHY_code
from users u left join office o on u.OFFICE_ID=o.id
left join office ro on o.PARENTID = ro.id
left join office mo on ro.PARENTID = mo.id;

alter table users_role add (
constraint fk_users_role_users foreign key (userid) references users(id)
);



/* ************ 98/01/20 *************** */

ALTER TABLE APPROVALS
MODIFY (F_TYPE_CIRCULARS NUMBER(11, 0) );

ALTER TABLE APPROVALS
MODIFY (F_AUTHORITIES NUMBER(11, 0) );

ALTER TABLE APPROVALS
MODIFY (F_CONDITION NUMBER(11, 0) );

ALTER TABLE APPROVALS
MODIFY (F_HEADQUARTERS NUMBER(11, 0) );

ALTER TABLE APPROVALS
MODIFY (F_CLASSIFICATION NUMBER(11, 0) );

ALTER TABLE APPROVALS
MODIFY (F_IMMEDIATE NUMBER(11, 0) );

ALTER TABLE AUDIENCES
MODIFY (F_AUDIENCES NUMBER(11, 0) );

update users u set u.CREATE_DATE=sysdate;

/* ***************************************
980311
****************************************** */

ALTER TABLE USER_COMMENTS
MODIFY (BODY_TXT VARCHAR2(2000 BYTE) );

ALTER TABLE NOTIFY
ADD (RECIPIENT_DISABLE NUMBER(1) DEFAULT 0 );




ALTER TABLE APPROVALS
ADD (F_USER_CREATOR int );

ALTER TABLE APPROVALS
ADD (F_USER_CREATOR int );

ALTER TABLE APPROVALS
ADD (TMP_ARTICLEID int );

ALTER TABLE notify
ADD (RECIPIENT_DISABLE NUMBER(1,0) );


  CREATE OR REPLACE FORCE VIEW VW_TRANSFER_SECTION_REQUIRE (ID, F_APPROVAL, HIERARCHY, F_PARENT, TREE_ORDER, NEXT_TREE_ORDER, PREV_TREE_ORDER, NEXT_SIBLING_TREE_ORDER, LAST_CHILD_TREE_ORDER) AS
  select target.id
  ,target.f_approval
  ,target.hierarchy
  ,target.f_parent
  ,target.tree_order
  ,target.next_tree_order
  ,target.prev_tree_order
  ,NVL(target.next_sibling_tree_order
    ,NVL((select min(target_next.tree_order) from section target_next where target_next.f_approval=target.f_approval and target_next.tree_order>target.last_child_tree_order),(target.last_child_tree_order+2)))
    as next_sibling_tree_order
  ,target.last_child_tree_order
from (
  select target.id
  ,target.f_approval
  ,target.hierarchy
  ,target.f_parent
  ,target.tree_order
  ,NVL((select min(target_next.tree_order) from section target_next where target_next.f_approval=target.f_approval and target_next.tree_order>target.tree_order),(target.tree_order+2)) as next_tree_order
  ,NVL((select max(target_prev.tree_order) from section target_prev where target_prev.f_approval=target.f_approval and target_prev.tree_order<target.tree_order),0) as prev_tree_order
  ,(select min(target_next_sibling.tree_order) from section target_next_sibling where nvl(target_next_sibling.f_parent,0)=nvl(target.f_parent,0) and target_next_sibling.tree_order>target.tree_order) as next_sibling_tree_order
  ,NVL((SELECT MAX(last_child.tree_order) FROM section last_child WHERE (last_child.hierarchy LIKE (target.hierarchy||target.id||'.%'))),target.tree_order) last_child_tree_order
from section target
)target
order by target.tree_order;






/********************************************************************
    981009-batch tables
*********************************************************************/
--alter TABLE BATCH_JOB_EXECUTION_PARAMS add constraint pk_job_execution_params primary(JOB_EXECUTION_ID,TYPE_CD);
--alter table BATCH_JOB_EXECUTION_CONTEXT drop constraint JOB_EXEC_CTX_FK ;
--alter table BATCH_JOB_EXECUTION_CONTEXT add constraint JOB_EXEC_CTX_FK foreign key (JOB_EXECUTION_ID)references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID);
--alter table BATCH_STEP_EXECUTION_CONTEXT drop constraint STEP_EXEC_CTX_FK;
--alter table BATCH_STEP_EXECUTION_CONTEXT add constraint STEP_EXEC_CTX_FK foreign key (STEP_EXECUTION_ID)	references BATCH_STEP_EXECUTION(STEP_EXECUTION_ID);
CREATE TABLE BATCH_JOB_INSTANCE  (
	JOB_INSTANCE_ID NUMBER(19,0)  NOT NULL PRIMARY KEY ,
	VERSION NUMBER(19,0) ,
	JOB_NAME VARCHAR2(100) NOT NULL,
	JOB_KEY VARCHAR2(32) NOT NULL,
	constraint JOB_INST_UN unique (JOB_NAME, JOB_KEY)
) ;

CREATE TABLE BATCH_JOB_EXECUTION  (
	JOB_EXECUTION_ID NUMBER(19,0)  NOT NULL PRIMARY KEY ,
	VERSION NUMBER(19,0)  ,
	JOB_INSTANCE_ID NUMBER(19,0) NOT NULL,
	CREATE_TIME TIMESTAMP NOT NULL,
	START_TIME TIMESTAMP DEFAULT NULL ,
	END_TIME TIMESTAMP DEFAULT NULL ,
	STATUS VARCHAR2(10) ,
	EXIT_CODE VARCHAR2(2500) ,
	EXIT_MESSAGE VARCHAR2(2500) ,
	LAST_UPDATED TIMESTAMP,
	JOB_CONFIGURATION_LOCATION VARCHAR(2500) NULL,
	constraint JOB_INST_EXEC_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
) ;

CREATE TABLE BATCH_JOB_EXECUTION_PARAMS  (
	JOB_EXECUTION_ID NUMBER(19,0) NOT NULL ,
	TYPE_CD VARCHAR2(6) NOT NULL ,
	KEY_NAME VARCHAR2(100) NOT NULL ,
	STRING_VAL VARCHAR2(250) ,
	DATE_VAL TIMESTAMP DEFAULT NULL ,
	LONG_VAL NUMBER(19,0) ,
	DOUBLE_VAL NUMBER ,
	IDENTIFYING CHAR(1) NOT NULL ,
	constraint JOB_EXEC_PARAMS_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
	/*,constraint pk_job_execution_params primary(JOB_EXECUTION_ID,TYPE_CD)*/
) ;

CREATE TABLE BATCH_STEP_EXECUTION  (
	STEP_EXECUTION_ID NUMBER(19,0)  NOT NULL PRIMARY KEY ,
	VERSION NUMBER(19,0) NOT NULL,
	STEP_NAME VARCHAR2(100) NOT NULL,
	JOB_EXECUTION_ID NUMBER(19,0) NOT NULL,
	START_TIME TIMESTAMP NOT NULL ,
	END_TIME TIMESTAMP DEFAULT NULL ,
	STATUS VARCHAR2(10) ,
	COMMIT_COUNT NUMBER(19,0) ,
	READ_COUNT NUMBER(19,0) ,
	FILTER_COUNT NUMBER(19,0) ,
	WRITE_COUNT NUMBER(19,0) ,
	READ_SKIP_COUNT NUMBER(19,0) ,
	WRITE_SKIP_COUNT NUMBER(19,0) ,
	PROCESS_SKIP_COUNT NUMBER(19,0) ,
	ROLLBACK_COUNT NUMBER(19,0) ,
	EXIT_CODE VARCHAR2(2500) ,
	EXIT_MESSAGE VARCHAR2(2500) ,
	LAST_UPDATED TIMESTAMP,
	constraint JOB_EXEC_STEP_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ;

CREATE TABLE BATCH_STEP_EXECUTION_CONTEXT  (
	STEP_EXECUTION_ID NUMBER(19,0) NOT NULL PRIMARY KEY,
	SHORT_CONTEXT VARCHAR2(2500) NOT NULL,
	SERIALIZED_CONTEXT CLOB
) ;
	--,constraint STEP_EXEC_CTX_FK foreign key (STEP_EXECUTION_ID)references BATCH_STEP_EXECUTION(STEP_EXECUTION_ID)

CREATE TABLE BATCH_JOB_EXECUTION_CONTEXT  (
	JOB_EXECUTION_ID NUMBER(19,0) NOT NULL PRIMARY KEY,
	SHORT_CONTEXT VARCHAR2(2500) NOT NULL,
	SERIALIZED_CONTEXT CLOB
) ;
--	,constraint JOB_EXEC_CTX_FK foreign key (JOB_EXECUTION_ID)references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)

CREATE SEQUENCE BATCH_STEP_EXECUTION_SEQ START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE BATCH_JOB_EXECUTION_SEQ START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE BATCH_JOB_SEQ START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;



/********************************************************************
    981012
*********************************************************************/
alter table notify add (RECIPIENT_DISABLE number(1) default 0 );



  CREATE OR REPLACE FORCE VIEW VW_APPROVAL_HEADQARTER (F_APPROVAL, APPROVAL_TITLE, STATUS, F_CLASSIFICATION, VALIDITY_DATE, LASTVERSION, NOTIFICATION_NUMBER, APPROVAL_DATE, CONDITION_ID, CONDITION_COLOR, CONDITION_TITLE, HEADQUARTER_ID, OFFICE_NAME, INDICATION_CODE, PAST_CODE, TYPE_ID, TYPE_TITLE, TOPICS) AS select approvals.id AS f_approval,
       approvals.title AS approval_title,
       approvals.f_status AS status,
       approvals.F_CLASSIFICATION AS F_CLASSIFICATION,
       approvals.VALIDITY_DATE AS VALIDITY_DATE,
       approvals.last_version AS lastVersion,
       approvals.notification_number as notification_number ,
       approvals.APPROVAL_DATE   as approval_date ,
	   bt_condition.id AS condition_id,
	   bt_condition.color AS condition_color,
	   bt_condition.title AS condition_title,
	   bt_headquarters_office.id AS headquarter_id,
	   bt_headquarters_office.office_name AS office_name,
	   bt_headquarters_office.indication_code AS indication_code,
	   bt_headquarters_office.past_code AS past_code,
	   bt_type.id AS type_id,bt_type.type_title AS type_title ,
     (SELECT  listagg(bt.TITLE,', ')within group (order by t.topics_id)  AS topics
      FROM   topics t left join bt_topic bt on t.F_TOPIC=bt.id where t.F_APPROVAL = approvals.id
      GROUP BY t.F_APPROVAL ) as topics
from (((approvals left join bt_headquarters_office on((approvals.f_headquarters = bt_headquarters_office.id))) join bt_condition on((approvals.f_condition = bt_condition.id))) join bt_type on((approvals.f_type_circulars = bt_type.id))) order by approvals.id

