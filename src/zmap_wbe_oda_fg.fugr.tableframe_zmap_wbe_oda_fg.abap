*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZMAP_WBE_ODA_FG
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZMAP_WBE_ODA_FG    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
