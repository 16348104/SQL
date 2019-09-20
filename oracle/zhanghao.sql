/* Formatted on 2019/9/19 18:26:38 (QP5 v5.256.13226.35510) */
--本科生

  SELECT *
    FROM V_CJ_BXQKCB_KC_JS_BS kc, xk_bks_xkb xk
   WHERE kc.kch = xk.kch AND kc.kxh = xk.kxh AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC
--研究生
/* Formatted on 2019/9/19 18:26:58 (QP5 v5.256.13226.35510) */
  SELECT *
    FROM V_CJ_BXQKCB_KC_JS_BS kc, xk_yjs_xkb xk
   WHERE kc.kch = xk.kch AND kc.kxh = xk.kxh AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC

--进修生
/* Formatted on 2019/9/19 18:27:03 (QP5 v5.256.13226.35510) */
  SELECT *
    FROM V_CJ_BXQKCB_KC_JS_BS kc, xk_jxs_xkb xk
   WHERE kc.kch = xk.kch AND kc.kxh = xk.kxh AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC

--旁听生
/* Formatted on 2019/9/19 18:27:13 (QP5 v5.256.13226.35510) */
  SELECT *
    FROM V_CJ_BXQKCB_KC_JS_BS kc, pt_xkb xk
   WHERE kc.kch = xk.kch AND kc.kxh = xk.kxh AND kc.xnxq = xk.xnxq
ORDER BY kc.xnxq DESC

--深研院
/* Formatted on 2019/9/19 18:27:08 (QP5 v5.256.13226.35510) */
SELECT *
  FROM V_CJ_BXQKCB_KC_JS_BS
 WHERE kch IN (SELECT kch
                 FROM kc_kcb
                WHERE kkdwnm = '291')