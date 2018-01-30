SHOW DATABASES;
USE scott;

#查看表注释的方法
SHOW TABLE STATUS;

#查看获取表内字段注释
SHOW FULL COLUMNS FROM dept;
SHOW FULL COLUMNS FROM emp;
# SHOW CREATE TABLE emp;

#获取整个数据库的所有表信息（包含表名，表注释，表类型等等）
SELECT
  table_name,
  table_type,
  engine
FROM information_schema.tables
WHERE table_schema = 'scott' # table_schema是数据库名
ORDER BY table_name DESC;

SELECT *
FROM scott.emp;
SELECT *
FROM scott.dept;
SELECT *
FROM scott.salgrade;