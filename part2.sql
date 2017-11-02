# PART II
# 1. 返回拥有员工的部门名、部门号
SELECT DISTINCT
  d.DEPTNO,
  d.DNAME
FROM scott.dept d
  JOIN scott.emp e
    ON d.DEPTNO = e.DEPTNO;
# 2. 工资多于 scott 的员工信息

# 3. 返回员工和所属经理的姓名

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名

# 5. 返回员工姓名及其所在的部门名称
