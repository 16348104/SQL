/* Formatted on 2019/9/19 18:26:38 (QP5 v5.256.13226.35510) */
--本科

SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_bks_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;

--研究生
/* Formatted on 2019/9/19 18:26:58 (QP5 v5.256.13226.35510) */
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_yjs_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


-- 进修生
/* Formatted on 2019/9/19 18:27:03 (QP5 v5.256.13226.35510) */
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     xk_jxs_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


--旁听生
/* Formatted on 2019/9/19 18:27:13 (QP5 v5.256.13226.35510) */
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     pt_xkb xk
WHERE kc.kch = xk.kch
  AND kc.kxh = xk.kxh
  AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC;


--深研院
/* Formatted on 2019/9/19 18:27:08 (QP5 v5.256.13226.35510) */
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
select *
from CJ_FXB t
         inner join
     cj_bks_bxqcjb b
     on
         (t.xnxq = b.xnxq
             and t.kch = b.kch
             and t.kxh = b.kxh)
where t.lrztm = '002';

-- 未提交成绩的研究生课程
select *
from CJ_FXB t
         inner join
     cj_yjs_bxqcjb yj on
         (t.xnxq = yj.xnxq
             and t.kch = yj.kch
             and t.kxh = yj.kxh)
where t.lrztm = '002';

--进修生未提交的课程
select *
from CJ_FXB t
         inner join xk_jxs_xkb jx
                    on (t.xnxq = jx.xnxq
                        and t.kch = jx.kch
                        and t.kxh = jx.kxh)
where t.lrztm = '002';

--旁听生未提交的课程--
select *
from CJ_FXB t
         inner join PT_XKB pt
                    on (t.xnxq = pt.xnxq and t.kch = pt.kch and t.kxh = pt.kxh)
where t.LRZTM = '002';
--  where t.xnxq = pt.xnxq
--    and t.kch = pt.kch
--    and t.kxh = pt.kxh

select *
from CJ_FXB t
         left outer join PT_XKB pt
                         on (t.xnxq = pt.xnxq and t.kch = pt.kch and t.kxh = pt.kxh)
where t.LRZTM = '001';
