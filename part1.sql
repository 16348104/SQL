SHOW DATABASES;
USE scott;
SHOW TABLE STATUS;
SHOW COLUMNS FROM dept;
SELECT *
FROM dept;
# 1. 查找部门 30 中员工的详细信息
SELECT *
FROM scott.dept
WHERE DEPTNO = 30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
SELECT
  EMPNO,
  ENAME,
  DEPTNO
FROM scott.emp
WHERE JOB = 'clerk';
# 3. 检索出奖金多于基本工资的员工信息
