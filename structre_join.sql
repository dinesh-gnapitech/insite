SELECT 
    st.GDB_ARCHIVE_OID AS STRUCTURE_GDB_ARCHIVE_OID,
    st.Shape AS STRUCTURE_Shape,
    st.STR_NUM AS STRUCTURE_STR_NUM,
    st.LINEID_1 AS STRUCTURE_LINEID_1,
    st.LINE_NAME1 AS STRUCTURE_LINE_NAME1,
    st.NUM_CIRCUITS AS STRUCTURE_NUM_CIRCUITS,
    st.STR_MAT AS STRUCTURE_STR_MAT,
    st.STR_TYPE AS STRUCTURE_STR_TYPE,
    st.HEIGHT AS STRUCTURE_HEIGHT,
    st.LINE_ANGLE AS STRUCTURE_LINE_ANGLE,
    st.ELEVATION AS STRUCTURE_ELEVATION,
    st.LATITUDE AS STRUCTURE_LATITUDE,
    st.LONGITUDE AS STRUCTURE_LONGITUDE,
    st.STATUS AS STRUCTURE_STATUS,
    st.COMMENTS AS STRUCTURE_COMMENTS,
    st.STR_ID AS STRUCTURE_STR_ID,
    st.OWNER AS STRUCTURE_OWNER,
    st.COUNTY AS STRUCTURE_COUNTY,
    st.REGION AS STRUCTURE_REGION,
    st.GDB_FROM_DATE AS STRUCTURE_GDB_FROM_DATE,
    st.GDB_TO_DATE AS STRUCTURE_GDB_TO_DATE,
    st.OBJECTID AS STRUCTURE_OBJECTID,
    su.GDB_ARCHIVE_OID AS SUPPORTSTRUCTURE_GDB_ARCHIVE_OID,
    su.STR_ID AS SUPPORTSTRUCTURE_STR_ID,
    su.STR_SUBTYPE AS SUPPORTSTRUCTURE_STR_SUBTYPE,
    su.STEEL_FINISH AS SUPPORTSTRUCTURE_STEEL_FINISH,
    su.DEADEND_TYPE AS SUPPORTSTRUCTURE_DEADEND_TYPE,
    su.MARK_BALL AS SUPPORTSTRUCTURE_MARK_BALL,
    su.BIRD_GUARDS AS SUPPORTSTRUCTURE_BIRD_GUARDS,
    su.GDB_FROM_DATE AS SUPPORTSTRUCTURE_GDB_FROM_DATE,
    su.GDB_TO_DATE AS SUPPORTSTRUCTURE_GDB_TO_DATE,
    su.OBJECTID AS SUPPORTSTRUCTURE_OBJECTID,
    sf.GDB_ARCHIVE_OID AS STRFOUNDATION_GDB_ARCHIVE_OID,
    sf.STR_ID AS STRFOUNDATION_STR_ID,
    sf.FND_TYPE AS STRFOUNDATION_FND_TYPE,
    sf.FND_ELEV AS STRFOUNDATION_FND_ELEV,
    sf.FND_REVEAL AS STRFOUNDATION_FND_REVEAL,
    sf.DEPTH_ROCK AS STRFOUNDATION_DEPTH_ROCK,
    sf.GDB_FROM_DATE AS STRFOUNDATION_GDB_FROM_DATE,
    sf.GDB_TO_DATE AS STRFOUNDATION_GDB_TO_DATE,
    sf.OBJECTID AS STRFOUNDATION_OBJECTID,
    gr.GDB_ARCHIVE_OID AS GRADE_GDB_ARCHIVE_OID,
    gr.GRADE_ID AS GRADE_GRADE_ID,
    gr.STR_ID AS GRADE_STR_ID,
    gr.POST_STEEL AS GRADE_POST_STEEL,
    gr.BASE_STEEL AS GRADE_BASE_STEEL,
    gr.OVERALL_GRADE AS GRADE_OVERALL_GRADE,
    gr.GDB_FROM_DATE AS GRADE_GDB_FROM_DATE,
    gr.GDB_TO_DATE AS GRADE_GDB_TO_DATE,
    gr.OBJECTID AS GRADE_OBJECTID
FROM 
    dbo.STRUCTURE st
LEFT JOIN 
    dbo.SUPPORTSTRUCTURE su ON st.STR_ID = su.STR_ID
LEFT JOIN 
    dbo.STRFOUNDATION sf ON st.STR_ID = sf.STR_ID
LEFT JOIN 
    dbo.GRADE gr ON st.STR_ID = gr.STR_ID;