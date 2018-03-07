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


--
SELECT *
FROM BBS_TOPIC
WHERE USER_ID = '2010212283';

SELECT *
FROM BBS_REPLY
WHERE USER_ID = '2006310601';
