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
  t.column_name,
  t.column_name
FROM user_col_comments t
WHERE t.table_name = 't_cod_list_tb';

-- 查询所有表的表名和表说明：
SELECT
  t.table_name,
  s.comments
FROM user_tables t INNER JOIN user_tab_comments s ON t.table_name = s.table_name;

--查看表中列的说明
select * from user_col_comments where TABLE_NAME='T_COD_LIST_TB';

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
