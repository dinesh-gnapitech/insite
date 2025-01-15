SELECT 
    -- Structure Table
    s.STR_ID AS Structure_ID,
    s.STR_NUM AS Structure_Number,
    s.LINEID_1 AS Line_ID,
    s.LINE_NAME1 AS Line_Name,
    s.NUM_CIRCUITS AS Num_Circuits,
    s.STR_TYPE AS Structure_Type,
    s.STR_MAT AS Structure_Material,
    s.HEIGHT AS Structure_Height,
    s.LATITUDE AS Structure_Latitude,
    s.LONGITUDE AS Structure_Longitude,
    s.OWNER AS Structure_Owner,
    s.COMMENTS AS Structure_Comments,

    -- Pole Table
    p.POLE_GUID AS Pole_GUID,
    p.STR_GUID AS Structure_GUID,
    p.POLE_NUM AS Pole_Number,
    p.POLE_MATERIAL AS Pole_Material,
    p.HEIGHT AS Pole_Height,
    p.LATITUDE AS Pole_Latitude,
    p.LONGITUDE AS Pole_Longitude,
    p.STATUS AS Pole_Status,

    -- SupportStructure Table
    ss.STR_ID AS SupportStructure_ID,
    ss.STEEL_FINISH AS Support_SteelFinish,
    ss.STR_ARM AS Support_Arm,
    ss.X_BRACE AS Support_XBrace,
    ss.NUM_ARMS AS Support_NumArms,

    -- ARM Table
    a.ARM_ID AS Arm_ID,
    a.STR_ID AS Arm_Structure_ID,
    a.ARM_TYPE AS Arm_Type,

    -- StrFoundation Table
    sf.STR_ID AS Foundation_Structure_ID,
    sf.FND_TYPE AS Foundation_Type,
    sf.DEPTH_ROCK AS Foundation_Depth_Rock,

    -- Switch Table
    sw.SWITCH_GUID AS Switch_GUID,
    sw.STRUCTURE_GUID AS Switch_Structure_GUID,
    sw.SWITCH_TYPE AS Switch_Type,
    sw.OPERATING_VOLTAGE AS Switch_Operating_Voltage,
    sw.LATITUDE AS Switch_Latitude,
    sw.LONGITUDE AS Switch_Longitude,

    -- FacilityRelation Table
    fr.STR_ID AS FacilityRelation_Structure_ID,
    fr.LINEID_2 AS Facility_LineID2,
    fr.LINEID_3 AS Facility_LineID3,
    fr.SWITCH_ID AS Facility_Switch_ID,

    -- Grade Table
    g.GRADE_ID AS Grade_ID,
    g.POLE_GUID AS Grade_Pole_GUID,
    g.POST_STEEL AS Grade_PostSteel,
    g.DIAGONAL_STEEL AS Grade_DiagonalSteel,
    g.BASE_STEEL AS Grade_BaseSteel,
    g.PERCENT_STEEL_LOSS AS Grade_Percent_Steel_Loss

FROM 
    dbo.STRUCTURE s
LEFT JOIN 
    dbo.POLE p ON s.STR_ID = p.STR_GUID
LEFT JOIN 
    dbo.SUPPORTSTRUCTURE ss ON s.STR_ID = ss.STR_ID
LEFT JOIN 
    dbo.ARM a ON s.STR_ID = a.STR_ID
LEFT JOIN 
    dbo.STRFOUNDATION sf ON s.STR_ID = sf.STR_ID
LEFT JOIN 
    dbo.SWITCH sw ON s.STR_ID = sw.STRUCTURE_GUID
LEFT JOIN 
    dbo.FACILITYRELATION fr ON s.STR_ID = fr.STR_ID
LEFT JOIN 
    dbo.GRADE g ON p.POLE_GUID = g.POLE_GUID;
