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
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     CJ_BKS_BXQCJB cj
WHERE kc.kch = cj.kch
  AND kc.kxh = cj.kxh
  AND kc.xnxq = cj.xnxq
  AND (cj.xh LIKE '2015%' OR cj.xh LIKE '2016%' OR cj.xh LIKE '2017%' OR cj.xh LIKE '2018%' OR cj.xh LIKE '2019%')
ORDER BY kc.kch;

-- 查找班级里本科生学号<2015的
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     CJ_BKS_BXQCJB cj
WHERE kc.kch = cj.kch
  AND kc.kxh = cj.kxh
  AND kc.xnxq = cj.xnxq
  AND NOT (cj.xh LIKE '2015%' OR cj.xh LIKE '2016%' OR cj.xh LIKE '2017%' OR cj.xh LIKE '2018%' OR cj.xh LIKE '2019%')
ORDER BY kc.kch, kc.kxh;


-- 查找班级里研究生学号>=2015的
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     CJ_YJS_BXQCJB cj
WHERE kc.kch = cj.kch
  AND kc.kxh = cj.kxh
  AND kc.xnxq = cj.xnxq
  AND (cj.xh LIKE '2015%' OR cj.xh LIKE '2016%' OR cj.xh LIKE '2017%' OR cj.xh LIKE '2018%' OR cj.xh LIKE '2019%')
ORDER BY kc.XNXQ;

-- 查找班级里研究生学号<2015的
SELECT *
FROM V_CJ_BXQKCB_KC_JS_BS kc,
     CJ_YJS_BXQCJB cj
WHERE kc.kch = cj.kch
  AND kc.kxh = cj.kxh
  AND kc.xnxq = cj.xnxq
  AND NOT (cj.xh LIKE '2015%' OR cj.xh LIKE '2016%' OR cj.xh LIKE '2017%' OR cj.xh LIKE '2018%' OR cj.xh LIKE '2019%')
ORDER BY kc.XNXQ;

-- --进修生
-- SELECT *
-- FROM V_CJ_BXQKCB_KC_JS_BS kc,
--   cj_jxs_cjb cj
-- WHERE kc.kch = cj.kch
--       AND kc.kxh = cj.kxh
--       AND kc.xnxq = cj.xnxq
--       AND (cj.xh LIKE '2015%' OR cj.xh LIKE '2016%' OR cj.xh LIKE '2017%' OR cj.xh LIKE '2018%' OR cj.xh LIKE '2019%')
-- ORDER BY kc.XNXQ;

--
--
--
--
-- 未提交成绩的本科生课程
SELECT t.XNXQ   AS 学年学期,
       t.KCH    AS 课程号,
       t.KXH    AS 课程号,
       t.LRZTM  AS 全体录入状态,
       bk.JSH1  AS 教师号,
       bk.XH    AS 学号,
       bk.LRZTM AS 单独录入状态
FROM CJ_FXB t
         INNER JOIN
     cj_bks_bxqcjb bk
     ON
         (t.xnxq = bk.xnxq
             AND t.kch = bk.kch
             AND t.kxh = bk.kxh)
WHERE t.lrztm = '002'
ORDER BY t.XNXQ DESC;

-- 未提交成绩的研究生课程
SELECT t.XNXQ   AS 学年学期,
       t.KCH    AS 课程号,
       t.KXH    AS 课程号,
       t.LRZTM  AS 全体录入状态,
       yj.JSH1  AS 教师号,
       yj.XH    AS 学号,
       yj.LRZTM AS 单独录入状态
FROM CJ_FXB t
         INNER JOIN
     cj_yjs_bxqcjb yj ON
         (t.xnxq = yj.xnxq
             AND t.kch = yj.kch
             AND t.kxh = yj.kxh)
WHERE t.lrztm = '002'
ORDER BY t.XNXQ DESC;

--进修生未提交的课程
SELECT t.XNXQ   AS 学年学期,
       t.KCH    AS 课程号,
       t.KXH    AS 课序号,
       t.LRZTM  AS 全体录入状态,
       jx.JSH1  AS 教师号,
       jx.XH    AS 学号,
       jx.LRZTM AS 单独录入状态
FROM CJ_FXB t
         INNER JOIN cj_jxs_cjb jx
                    ON (t.xnxq = jx.xnxq
                        AND t.kch = jx.kch
                        AND t.kxh = jx.kxh)
WHERE t.lrztm = '002'
ORDER BY t.XNXQ DESC;

--旁听生未提交的课程--
SELECT t.XNXQ   AS 学年学期,
       t.KCH    AS 课程号,
       t.KXH    AS 课序号,
       t.LRZTM  AS 全体录入状态,
       pt.JSH   AS 教师号,
       pt.PTXH  AS 学号,
       pt.LRZTM AS 单独录入状态
FROM CJ_FXB t
         INNER JOIN PT_XKB pt
                    ON (t.xnxq = pt.xnxq AND t.kch = pt.kch AND t.kxh = pt.kxh)
WHERE t.LRZTM = '001'
ORDER BY t.XNXQ DESC;
--  where t.xnxq = pt.xnxq
--    and t.kch = pt.kch
--    and t.kxh = pt.kxh
--
--
SELECT *
FROM CJ_FXB t
         LEFT OUTER JOIN PT_XKB pt
                         ON (t.xnxq = pt.xnxq AND t.kch = pt.kch AND t.kxh = pt.kxh)
WHERE t.LRZTM = '001';


-- 查学籍表
select *
from XS_YJS_XJB
where xh like '2018%'

-- bks
-- 2001990104   2013-2014-2	30450352(0)
-- 1999990292   2013-2014-2 00120052(90)


-- 1995990061   2013-2014-2  20250103(0)
-- yjs
-- 2010610319   2013-2014-2 80661933(0)
-- 1998990077   2013-2014-1 80590493(0) 80590463 (0)


-- 1992990038   2013-2014-1 70000022(0)
-- 1984990056   2013-2014-1 80220191(200)
-- 1970990283   2013-2014-1 80220191(200)
-- 2000990115
-- jxs
-- L29101       2010-2011-1  40510233(1)

-- bks2015
-- 2004990063 2013-2014-1 02070111(91) p/f

--jys2015
--2000990115  2013-2014-2 90660133(0)

--pts
--1999990019 2010-2011-1 80320062(0)/70320153(0)
--1999990252 2010-2011-1 70320153(0)

--jxs选本科生课
--1999990292  2013-2014-2 00120072(90)
--L29101      2010-2011-1 40510233(1)

-- 深研院
-- 1984990056 2013-2014-1 72910052(200)
-- S04726     2013-2014-1 70160563(200)

