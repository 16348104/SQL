# PART II
# 1. 返回拥有员工的部门名、部门号
SELECT DISTINCT
  d.DEPTNO,
  d.DNAME
FROM scott.dept d
  JOIN scott.emp e
    ON d.DEPTNO = e.DEPTNO;
# 2. 工资多于 scott 的员工信息