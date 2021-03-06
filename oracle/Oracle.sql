-- noinspection SqlResolveForFile

-- 查询所有表名：
SELECT table_name
FROM user_tables;

-- 查询所有字段名：
SELECT t.column_name
FROM user_col_comments t;

-- 查询指定表的所有字段名：
SELECT t.column_name
FROM user_col_comments t
WHERE t.table_name = 'T_COD_LIST_TB';

-- 查询指定表的所有字段名和字段说明：
SELECT
  t.column_name AS column_name1,
  t.column_name AS column_name2
FROM user_col_comments t
WHERE t.table_name = 'T_COD_LIST_TB';

-- 查询所有表的表名和表说明：
SELECT
  t.table_name,
  s.comments
FROM user_tables t INNER JOIN user_tab_comments s ON t.table_name = s.table_name;

--查看表中列的说明
SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'T_COD_LIST_TB';

-- 查询模糊表名的表名和表说明：
SELECT t.table_name
FROM user_tables t
WHERE t.table_name LIKE 'BIZ_DICT%';

SELECT
  t.table_name,
  f.comments
FROM user_tables t INNER JOIN user_tab_comments f ON t.table_name = f.table_name
WHERE t.table_name LIKE 'BIZ_DICT%';
-- oracle数据库表名区分大小写


--查看当前用户下的所有表
SELECT t.table_name
FROM USER_TABLES t;

--查看表的说明
SELECT *
FROM user_tab_comments
WHERE TABLE_NAME = 'USER_INFO';

--查看表的相关属性：字段名称,数据类型,是否主键，是否为空，缺省值，是否唯一，字段描述
SELECT *
FROM user_tab_columns
WHERE table_name = 'SYS_USER';

--查看表中列的说明
SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'USER_INFO';

--查询表中的ID列名(cu.*column_name 为ID)
SELECT cu.*
FROM user_cons_columns cu, user_constraints au
WHERE cu.constraint_name = au.constraint_name AND au.constraint_type = 'P' AND au.table_name = '要查询的表';
-- 查询数据库时间
select sysdate from dual;

--
SELECT *
FROM BBS_TOPIC
WHERE USER_ID = '2010212283';

SELECT *
FROM BBS_REPLY
WHERE USER_ID = '2006310601';

SELECT *
FROM BBS_REPLY;
SELECT *
FROM BBS_REPLY
WHERE TOPIC_ID = '13643';

-- 删除新版网络学堂重复作业记录
DELETE
FROM
  COURSE_HOMEWORK_RECORD CHR
WHERE
  (
    chr.STUDENT_ID, chr.HOMEWK_ID) IN
  (
    SELECT
      STUDENT_ID,
      HOMEWK_ID
    FROM
      COURSE_HOMEWORK_RECORD
    GROUP BY
      STUDENT_ID,
      HOMEWK_ID
    HAVING
      COUNT(*) > 1)
  AND ROWID NOT IN
      (
        SELECT MIN(ROWID)
        FROM
          COURSE_HOMEWORK_RECORD
        GROUP BY
          STUDENT_ID,
          HOMEWK_ID
        HAVING
          COUNT(*) > 1);

-- 删除新版网络学堂作业名单中序号是偶数的并重复的记录
DELETE FROM COURSE_HOMEWORK_RECORD
WHERE MOD(SEQ_ID, 2) = 0
      AND HOMEWK_ID = 370059
      AND STUDENT_ID IN (SELECT STUDENT_ID
                         FROM COURSE_HOMEWORK_RECORD
                         WHERE HOMEWK_ID = 370059
                         GROUP BY STUDENT_ID
                         HAVING COUNT(*) > 1);

--单表用in
SELECT *
FROM ZHJW_V_XS_XJB
WHERE XH IN ('2014080042', '2012011344', '2011011318', '2014012276');

--UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
UPDATE WLXT.ZHJW_V_XS_XJB
SET EMAIL2 = 'xdx2016@mail.tsinghua.edu.cn'
WHERE EMAIL2 LIKE 'xdx2016@tsinghua.edu.cn';


SELECT *
FROM (SELECT
        wlkc_jsb.WLKCID,
        WLKC_JSB.jsh,
        WLKC_JSB.JSLX
      FROM WLKC_JSB
      WHERE CZR = '2011990058')
WHERE JSLX = '0';

/*SELECT
  wlkc_jsb.WLKCID,
  WLKC_JSB.jsh,
  WLKC_JSB.JSLX
FROM WLKC_JSB
WHERE CZR = '2011990058'*/

/*SELECT *
FROM WLXT.ZHJW_V_JS_JBXXB
WHERE JSH = '2004980847';*/

SELECT *
FROM WLKC_XSZYB
WHERE ZYID = '8080801f64693ef901646958285f000c';

--教师信息
-- SELECT *
-- FROM ZHJW_V_JS_JBXXB
-- WHERE JSH = '2011990058';

--更改教师email
-- update ZHJW_V_JS_JBXXB t
-- set t.email='dj10005@tsing.edu.cn'
-- where t.jsh='1992990279';

--学生信息
SELECT *
FROM ZHJW_V_XS_XJB
WHERE XH = '2011011318';

--更改学生信息
-- update ZHJW_V_XS_XJB t
-- set t.EMAIL2='dj10005@tsing.edu.cn'
-- where t.XH='';

--学生分组
SELECT
  WLKCID,
  FZFAID,
  qzid,
  QZMC
FROM WLKC_QZB
WHERE FZFAID = '8080801f648e452201648ece787b00cf';

--分组成员
SELECT *
FROM WLKC_QZCYB
WHERE QZID = '177331';

SELECT *
FROM V_WLKC_JSQXB
WHERE WLKCID = '80240673' AND JSH = '2011990058';

SELECT *
FROM WLKC_JSQXB
WHERE JSH = '2011990058' AND WLKCID = '80240673';

--课程负责人
SELECT ryh
FROM V_WLKC_JSB_ALL
WHERE wlkcid = '30240551';

--教师课程表
SELECT *
FROM WLKC_KCB
WHERE WLKCID = '30240551';

--学生选课
--602402022011990058(全体方案)
--49928(全体组)
SELECT
  q.wlkcid,
  z.XH,
  z.XM
FROM WLKC_QZCYB q
  JOIN ZHJW_V_XS_XJB z
    ON q.RYH = z.XH
WHERE q.WLKCID = '60240202';

--
SELECT *
FROM wlkc_qzcyb cy, wlkc_kcb kc
WHERE cy.ryh = '2015012124' AND cy.wlkcid = kc.wlkcid AND kc.xnxq = '2018-2019-1';


--录入当前日期获取当前学年学期（唯一）
SELECT this.XNXQ   AS XNXQ1,
       this.KSSJ   AS KSSJ2,
       this.JSSJ   AS JSSJ3,
       this.XNXQMC AS XNXQMC4
FROM ZHJW_V_CODE_XNXQ this
WHERE '2019-09-16' >= this.KSSJ
  AND '2019-09-16' <= this.JSSJ;


--成员表
SELECT *
FROM WLKC_QZCYB a
  INNER JOIN WLKC_QZB b
  ON a.WLKCID=b.WLKCID AND a.QZID=b.QZID
WHERE b.QZID='38288389'AND a.WLKCID='2018-2019-170dd9d2002c54743874c5f6a3b339fea';


-- 查询数据库时间
-- select sysdate from dual;

-- 限制返回查询结果条数
select *
from (
         SELECT *
         FROM YJ_YJXXB t
         WHERE WLKCID = '2018-2019-160240202'
           and LY = 'GG'
         ORDER BY FSRQ desc)

where ROWNUM <= 200;


