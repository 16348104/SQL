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

# 3. 返回员工和所属经理的姓名

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名

# 5. 返回员工姓名及其所在的部门名称
