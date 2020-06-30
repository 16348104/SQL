-- 重置交费
update BZ_MY_KSBMXX
set sfyff = '未交',
    cs_bz = 'Y'
where ksbh = '2017000040'
  and bknf = '2017';

-- 重置线上确认状态
update BZ_MY_CSB
set XSQRBZ = '',
    XSQRZT = ''
where ksbh = '2017000040';
