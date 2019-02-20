CREATE OR REPLACE FORCE VIEW WLXT.V_WLKC_XS_GGB
(
   ID,
   GGID,
   BT,
   XH,
   WLKCID,
   FBR,
   FBSJ,
   YDSJ,
   SFQD,
   GGNR,
   FJMC
)
   BEQUEATH DEFINER
AS
   SELECT a.ggid || b.ryh id,
          a.GGID,
          A.BT,
          b.ryh XH,
          A.WLKCID,
          (CASE WHEN Z.JSM IS NOT NULL THEN Z.JSM ELSE v.xm END) AS FBR,
          A.FBSJ,
          (SELECT TO_CHAR (MAX (c.ydsj), 'yyyy-MM-dd')
             FROM WLKC_GGYDB c
            WHERE     a.wlkcid = c.wlkcid(+)
                  AND a.ggid = c.ggid(+)
                  AND b.ryh = c.xh(+))
             AS ydsj,
          a.sfqd,
          a.ggnr,
          F.BT AS fjmc
     FROM WLKC_GGB a,
          WLKC_QZCYB b,
          zhjw_v_js_jbxxb Z,
          WLKC_GGFJB f,
          ZHJW_V_XS_XJB v
    WHERE     a.wlkcid = b.wlkcid(+)
          AND a.FBR = Z.JSH(+)
          AND A.GGID = F.GGID(+)
          AND a.FBR = V.XH(+)
          AND (a.mxdx = b.qzid OR a.mxdx LIKE '%' || b.qzid || '%');
