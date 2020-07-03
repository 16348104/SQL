-- 重置交费
-- update BZ_MY_KSBMXX
-- set sfyff = '未交',
--     cs_bz = 'Y'
-- where ksbh = '2017000040'
--   and bknf = '2017';

-- 重置线上确认状态
-- update BZ_MY_CSB
-- set XSQRBZ = '',
--     XSQRZT = ''
-- where ksbh = '2017000040';

-- 重复打印准考证
-- update BZ_MY_KSBMXX
-- set GDH  = '',
--     ZKZH = ''
-- where ksbh = '2017000040'
--   and bknf = '2017';

--查询发放状态值
select a.ZKZH AS 准考证号, a.FFZTM AS 发放状态
from BZ_MY_ZKZB a
         inner join BZ_MY_KSBMXX b on a.ZKZH = b.ZKZH
where b.KSBH = '2017000042';

--更新发放状态值
update BZ_MY_ZKZB a
set a.FFZTM=''
where exists(select * from BZ_MY_KSBMXX b where b.ZKZH = a.ZKZH and b.KSBH = '2017000042' and BKNF = '2017');

--  UPDATE BZ_MY_ZKZB a
--      INNER JOIN BZ_MY_KSBMXX b
-- on a.ZKZH = b.ZKZH
-- set a.FFZTM=''
--     where b.KSBH = '2017000040'


