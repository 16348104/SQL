# PART II
# 1. 返回拥有员工的部门名、部门号
SELECT DISTINCT
  emp.DEPTNO,
  dept.DNAME
FROM emp, dept
WHERE emp.DEPTNO = dept.DEPTNO;
# SELECT DISTINCT
#   emp.DEPTNO,
#   dept.DNAME
# FROM dept
#   LEFT JOIN emp ON dept.DEPTNO = emp.DEPTNO;
# 左外连接

# 2. 工资多于 scott 的员工信息
SELECT *
FROM emp
WHERE SAL + ifnull(comm, 0) >
      (SELECT SAL + ifnull(COMM, 0)
       FROM emp
       WHERE emp.ENAME = 'scott');
# 不相关子查询
SELECT x.*
FROM scott.emp x
  JOIN scott.emp y ON x.SAL + ifnull(x.COMM, 0) > y.SAL + ifnull(y.COMM, 0)
WHERE y.ENAME = 'scott'; #自身连接

# 3. 返回员工和所属经理的姓名
SELECT
  e1.ENAME,
  e2.ENAME
FROM scott.emp e1
  JOIN scott.emp e2 ON e1.MGR = e2.EMPNO;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
SELECT
  e1.ENAME AS Ename,
  e2.ENAME AS Mname
FROM scott.emp e1
  JOIN scott.emp e2
    ON e1.MGR = e2.EMPNO
WHERE e1.HIREDATE < e2.HIREDATE;

# 5. 返回员工姓名及其所在的部门名称
SELECT
  emp.ENAME,
  dept.DNAME
FROM emp, dept
WHERE emp.DEPTNO = dept.DEPTNO;

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  JOIN scott.dept d ON e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  JOIN scott.dept d ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'clerk';

# 7. 返回部门号及其本部门的最低工资
SELECT
  emp.DEPTNO,
  min(SAL + ifnull(comm, 0)) AS sal
FROM scott.emp
GROUP BY emp.DEPTNO;

# 8. 返回销售部 sales 所有员工的姓名
SELECT e.ENAME
FROM scott.emp e
  JOIN scott.dept d ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME = 'SALES';

SELECT emp.ENAME
FROM scott.emp
WHERE DEPTNO = (
  SELECT dept.DEPTNO
  FROM scott.dept
  WHERE dept.DNAME = 'sales'
);

# 9. 返回工资多于平均工资的员工
SELECT *
FROM scott.emp
WHERE sal + ifnull(comm, 0) >
      (SELECT avg(SAL + ifnull(COMM, 0))
       FROM scott.emp);

# 10. 返回与 scott 从事相同工作的员工
# SELECT *
# FROM scott.emp
# WHERE emp.JOB in
#       (SELECT emp.job
#        FROM scott.emp
#        WHERE ENAME = 'scott');

SELECT e1.*
FROM scott.emp e1
  JOIN scott.emp e2 ON e1.JOB = e2.job
WHERE e2.ENAME = 'scott';

# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
SELECT
  emp.ENAME,
  sal + ifnull(comm, 0) AS 工资
FROM scott.emp
WHERE sal + ifnull(comm, 0) >
      (SELECT avg(SAL + ifnull(COMM, 0))
       FROM scott.emp
       WHERE emp.DEPTNO = 30);
# 12. 返回工资高于30部门所有员工工资水平的员工信息
SELECT *
FROM scott.emp
WHERE (SAL + ifnull(COMM, 0)) > (
  SELECT max(SAL + ifnull(comm, 0))
  FROM scott.emp
  WHERE DEPTNO = 30
);

# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
SELECT
  d.*,
  count(e.EMPNO) AS num
FROM scott.dept d LEFT JOIN scott.emp e ON d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO;

# 14. 返回员工的姓名、所在部门名及其工资
SELECT
  scott.emp.ENAME,
  scott.dept.DNAME,
  scott.emp.SAL + ifnull(emp.comm, 0) 工资
FROM scott.emp
  JOIN scott.dept ON emp.DEPTNO = dept.DEPTNO;

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
SELECT e1.*,e2.*
FROM scott.emp e1
  JOIN scott.emp e2 ON e1.job = e2.JOB AND e1.DEPTNO <> e2.DEPTNO;

# 16. 返回员工的详细信息，包括部门名
SELECT
  e.*,
  d.DNAME
FROM scott.emp e
  JOIN scott.dept d ON e.DEPTNO = d.DEPTNO;
# 17. 返回员工工作及其从事此工作的最低工资
SELECT
  emp.JOB,
  min(emp.SAL + ifnull(emp.COMM, 0)) AS min
FROM scott.emp
GROUP BY emp.JOB;

# 18. 返回不同部门经理的最低工资
SELECT
  emp.DEPTNO,
  min(SAL + ifnull(COMM, 0)) AS min
FROM scott.emp
WHERE JOB = 'MANAGER'
GROUP BY DEPTNO;

# 19. 计算出员工的年薪，并且以年薪排序
SELECT
  emp.ENAME,
  (emp.SAL + ifnull(comm, 0)) * 12 AS 年薪
FROM scott.emp
ORDER BY 2 DESC;

# 20. 返回工资处于第 4 级别的员工的姓名


