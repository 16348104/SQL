--本科生
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_bks_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;

--研究生
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_yjs_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


-- 进修生
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_jxs_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


--旁听生
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     pt_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


--深研院
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS
WHERE kch IN (SELECT kch
              FROM kc_kcb
              WHERE kkdwnm = '291');

-- 查找班级里本科生学号>=2015的
select *
from V_CJ_BXQKCB_KC_JS_BS kc,
     xk_bks_xkb xk
where kc.kch = xk.kch
  and kc.kxh = xk.kxh
  and kc.xnxq = xk.xnxq
  and (xk.xh like '2015%' or xk.xh like '2016%' or xk.xh like '2017%' or xk.xh like '2018%' or xk.xh like '2019%')
order by kc.kch, kc.kxh;

-- 查找班级里本科生学号<2015的
select *
from V_CJ_BXQKCB_KC_JS_BS kc,
     xk_bks_xkb xk
where kc.kch = xk.kch
  and kc.kxh = xk.kxh
  and kc.xnxq = xk.xnxq
  and not (xk.xh like '2015%' or xk.xh like '2016%' or xk.xh like '2017%' or xk.xh like '2018%' or xk.xh like '2019%')
order by kc.kch, kc.kxh;

-- 查找班级里研究生学号>=2015的
select *
from V_CJ_BXQKCB_KC_JS_BS kc,
     XK_YJS_XKB xk
where kc.kch = xk.kch
  and kc.kxh = xk.kxh
  and kc.xnxq = xk.xnxq
  and (xk.xh like '2015%' or xk.xh like '2016%' or xk.xh like '2017%' or xk.xh like '2018%' or xk.xh like '2019%')
order by kc.kch, kc.kxh;

-- 查找班级里研究生学号<2015的
select *
from V_CJ_BXQKCB_KC_JS_BS kc,
     XK_YJS_XKB xk
where kc.kch = xk.kch
  and kc.kxh = xk.kxh
  and kc.xnxq = xk.xnxq
  and not (xk.xh like '2015%' or xk.xh like '2016%' or xk.xh like '2017%' or xk.xh like '2018%' or xk.xh like '2019%')
order by kc.kch, kc.kxh;


--
--
--
--
-- 未提交成绩的本科生课程
-- select t.XNXQ,t.KXH,t.KCH,t.LRZTM,t.JSH
select t.XNXQ, t.KXH, t.KCH, t.LRZTM, bk.JSH1
from CJ_FXB t
         inner join
     cj_bks_bxqcjb bk
     on
         (t.xnxq = bk.xnxq
             and t.kch = bk.kch
             and t.kxh = bk.kxh)
where t.lrztm = '002'
order by t.XNXQ desc;

-- 未提交成绩的研究生课程
-- select *
select t.XNXQ, t.KXH, t.KCH, t.LRZTM, yj.JSH1
from CJ_FXB t
         inner join
     cj_yjs_bxqcjb yj on
         (t.xnxq = yj.xnxq
             and t.kch = yj.kch
             and t.kxh = yj.kxh)
where t.lrztm = '002'
order by t.XNXQ desc;

--进修生未提交的课程
-- select *
select t.XNXQ, t.KXH, t.KCH, t.LRZTM, jx.JSH1
from CJ_FXB t
         inner join cj_jxs_cjb jx
                    on (t.xnxq = jx.xnxq
                        and t.kch = jx.kch
                        and t.kxh = jx.kxh)
where t.lrztm = '002'
order by t.XNXQ desc;

--旁听生未提交的课程--
-- select *
select t.XNXQ, t.KXH, t.KCH, t.LRZTM, pt.JSH
from CJ_FXB t
         inner join PT_XKB pt
                    on (t.xnxq = pt.xnxq and t.kch = pt.kch and t.kxh = pt.kxh)
where t.LRZTM = '002'
order by t.XNXQ desc;
--  where t.xnxq = pt.xnxq
--    and t.kch = pt.kch
--    and t.kxh = pt.kxh

select *
from CJ_FXB t
         left outer join PT_XKB pt
                         on (t.xnxq = pt.xnxq and t.kch = pt.kch and t.kxh = pt.kxh)
where t.LRZTM = '001';

-- bks
-- 2001990104   2013-2014-2	30450352(0)


-- 1995990061   2013-2014-2  20250103(0)
-- yjs
-- 2010610319   2013-2014-2 80661933(0)
-- 1998990077   2013-2014-1 80590493(0) 80590463 (0)


-- 1992990038   2013-2014-1 70000022(0)
-- 1984990056   2013-2014-1 80220191 (200)
-- 1970990283   2013-2014-1 80220191 (200)
-- 2000990115
