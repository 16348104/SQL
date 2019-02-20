CREATE PROCEDURE P_trans_01to18
  (
    begin_xnxq IN VARCHAR2,
    end_xnxq   IN VARCHAR2
  )
IS
  BEGIN

    /*课件 ****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'KJ',
        T_COURSE_PUB_FILE.FILE_ID,
        T_COURSE_PUB_FILE.FILE_LINK,
        T_COURSE_PUB_FILE.REG_USER
      FROM
        T_COURSE_PUB_FILE,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_COURSE_PUB_FILE.FILE_LINK IS NOT NULL AND UPPER(T_COURSE_PUB_FILE.FILE_LINK) <> 'NULL' AND
        T_COURSE_PUB_FILE.COURSE_ID = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET s_file_fullname =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/download/' || s_file_link
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'KJ_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/KJ'
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'KJ' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*老师布置的作业 ****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'ZY',
        T_HOMEWORK_INFO.ID,
        T_HOMEWORK_INFO.HOMEWK_LINK,
        T_COURSE_ACTIVE.TEACHER_ID
      FROM
        T_HOMEWORK_INFO,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_HOMEWORK_INFO.HOMEWK_LINK IS NOT NULL AND UPPER(T_HOMEWORK_INFO.HOMEWK_LINK) <> 'NULL' AND
        T_HOMEWORK_INFO.COURSE_ID = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET s_file_fullname =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/homework/' || s_file_link
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'ZY_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/ZY'
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'ZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*老师布置的作业答案****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'ZYDA',
        T_HOMEWORK_INFO.ID,
        T_HOMEWORK_INFO.ANSWER_LINK,
        T_COURSE_ACTIVE.TEACHER_ID
      FROM
        T_HOMEWORK_INFO,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_HOMEWORK_INFO.ANSWER_LINK IS NOT NULL AND UPPER(T_HOMEWORK_INFO.ANSWER_LINK) <> 'NULL' AND
        T_HOMEWORK_INFO.COURSE_ID = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET s_file_fullname =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/homework/' || s_file_link
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'ZYDA_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/ZY'
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'ZYDA' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*学生提交的作业****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'XSZY',
        T_HOMEWORK_RECORD.ID,
        T_HOMEWORK_RECORD.HOMEWK_LINK,
        T_HOMEWORK_RECORD.STUDENT_ID
      FROM
        T_HOMEWORK_RECORD,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_HOMEWORK_RECORD.HOMEWK_LINK IS NOT NULL AND UPPER(T_HOMEWORK_RECORD.HOMEWK_LINK) <> 'NULL' AND
        T_HOMEWORK_RECORD.COURSE_ID = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET s_file_fullname =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/homewkrec/' || s_file_link
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'XSZY_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/ZY'
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'XSZY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*学生提交的作业 评语****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'ZYPY',
        T_HOMEWORK_RECORD.ID,
        T_HOMEWORK_RECORD.REPLY_LINK,
        T_HOMEWORK_RECORD.TEACHER_ID
      FROM
        T_HOMEWORK_RECORD,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_HOMEWORK_RECORD.REPLY_LINK IS NOT NULL AND UPPER(T_HOMEWORK_RECORD.REPLY_LINK) <> 'NULL' AND
        T_HOMEWORK_RECORD.COURSE_ID = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET s_file_fullname =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/homewkrec/' || s_file_link
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'ZYPY_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/ZY'
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'ZYPY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*BBS****************************/

    DELETE FROM TRANS_File
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'BBS',
        T_BBS_NOTE.NOTE_ID,
        T_BBS_NOTE.DOC_LINK,
        T_BBS_NOTE.USER_ID
      FROM
        T_BBS_NOTE,
        T_BBS_CATEGORY,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_BBS_NOTE.STATUS = '0000' AND
        T_BBS_NOTE.BBS_TYPE = '普通' AND
        T_BBS_NOTE.DOC_LINK IS NOT NULL AND UPPER(T_BBS_NOTE.DOC_LINK) <> 'NULL' AND
        T_BBS_NOTE.CATEGORY = T_BBS_CATEGORY.CATEGORY AND
        T_BBS_CATEGORY.OBJECT_ID1 = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET
      s_file_fullname = '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/bbsfile/'
                        || s_file_link
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'BBS_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/BBS'
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'BBS' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    /*答疑****************************/
    DELETE FROM TRANS_File
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    INSERT INTO TRANS_File (seq_no, s_xnxq, s_wlkcid, s_kch, s_kxh, s_yw_type, s_yw_id, s_file_link, s_user_id)
      SELECT
        seq_tans_no.nextval,
        TRANS_T_SEMESTER_INFO.XNXQ,
        T_COURSE_ACTIVE.COURSE_ID,
        T_COURSE_ACTIVE.COURSE_NO,
        T_COURSE_ACTIVE.COURSE_SEQ,
        'DY',
        T_BBS_NOTE.NOTE_ID,
        T_BBS_NOTE.DOC_LINK,
        T_BBS_NOTE.USER_ID
      FROM
        T_BBS_NOTE,
        T_BBS_CATEGORY,
        T_COURSE_ACTIVE,
        TRANS_T_SEMESTER_INFO
      WHERE
        T_BBS_NOTE.STATUS = '0000' AND
        T_BBS_NOTE.BBS_TYPE = '课程答疑' AND
        T_BBS_NOTE.DOC_LINK IS NOT NULL AND UPPER(T_BBS_NOTE.DOC_LINK) <> 'NULL' AND
        T_BBS_NOTE.CATEGORY = T_BBS_CATEGORY.CATEGORY AND
        T_BBS_CATEGORY.OBJECT_ID1 = T_COURSE_ACTIVE.COURSE_ID AND
        T_COURSE_ACTIVE.SEMISTER_ID = TRANS_T_SEMESTER_INFO.ID AND
        TRANS_T_SEMESTER_INFO.XNXQ >= begin_xnxq AND TRANS_T_SEMESTER_INFO.XNXQ <= end_xnxq;

    UPDATE TRANS_FILE
    SET
      s_file_fullname = '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/old/' || s_wlkcid || '/bbsfile/'
                        || s_file_link
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = 'BBS_2001_' || s_xnxq || '_' || s_kch || '-' || s_kxh || '_' || nvl(s_user_id, '') || '_' ||
                      seq_trans_fileno.nextval
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_link = t_file_link || substr(s_file_link, instr(s_file_link, '.', -1), length(s_file_link))
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq AND instr(s_file_link, '.', -1) > 0;

    UPDATE TRANS_FILE
    SET t_path =
    '/home/tomcatapp/wlxt2018/htdocs/CurVersion/WEB-INF/uploadFiles/courseWare/course/' || s_xnxq || '/' || s_xnxq ||
    '_' || s_kch || '-' || s_kxh || '/BBS'
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    UPDATE TRANS_FILE
    SET t_file_fullname = t_path || '/' || t_file_link
    WHERE s_yw_type = 'DY' AND s_xnxq >= begin_xnxq AND s_xnxq <= end_xnxq;

    COMMIT;


    UPDATE TRANS_FILE
    SET s_path_file = s_file_fullname;
    UPDATE TRANS_FILE
    SET s_path_file = REPLACE(s_path_file, '\', '\\');
    UPDATE TRANS_FILE
    SET s_path_file = REPLACE(s_path_file, '$', '\$');
    UPDATE TRANS_FILE
    SET s_path_file = REPLACE(s_path_file, '"', '\"');
    UPDATE TRANS_FILE
    SET s_path_file = REPLACE(s_path_file, '`', '\`');
    UPDATE TRANS_FILE
    SET s_path_file = REPLACE(s_path_file, '!', '\!');

    UPDATE TRANS_FILE
    SET cp_command =
    'echo `date` ''start: cp "' || s_path_file || '" "' || t_file_fullname || '"' || '''' || CHR(10)
    || 'mkdir -p  ' || t_path || CHR(10)
    || 'cp -f  "' || s_path_file || '"   "' || t_file_fullname || '"' || CHR(10) || CHR(10);

    COMMIT;

  END;
/


