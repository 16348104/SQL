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

# 5. 返回员工姓名及其所在的部门名称
SELECT
  emp.ENAME,
  dept.DNAME
FROM emp, dept
WHERE emp.DEPTNO = dept.DEPTNO;

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e JOIN scott.dept d ON e.DEPTNO = d.DEPTNO;


