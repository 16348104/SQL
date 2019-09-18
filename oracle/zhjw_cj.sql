--更新单个成绩提交状态
-- cj_bks_bxqcjb
-- cj_yjs_bxqcjb
-- cj_jxs_cjb
-- pt_xkb    LRZTM   001已提交002暂存

-- update cj_bks_bxqcjb
-- set LRZTM = '002'
-- where XNXQ = '2013-2014-1'
--   and KCH = '02070111'
--   and KXH = '91';

select xnxq,
       kch,
       xh,
       kssj,
       kxh,
       jsh1,
       lrztm,
       djzcj,
       fdjzcj,
       lrsj,
       CZR
from cj_bks_bxqcjb
where XNXQ = '2013-2014-1'
  and KCH = '02070111'
  and KXH = '91';

--更新课程成绩全体提交状态
--CJ_FXB LRZTM  001已提交  002暂存

-- update CJ_FXB
-- set LRZTM='002'
-- where XNXQ = '2013-2014-2'
--   and KCH = '02070111'
--   and KXH = '91';

-- 成绩分析表
select XNXQ, KCH, KXH, JSH, LRZTM, CZR, CZSJ
from CJ_FXB
where XNXQ = '2013-2014-2'
  and KCH = '02070111'
  and KXH = '91';

-- L29101 深研院加课  原jsh1='1991990219'