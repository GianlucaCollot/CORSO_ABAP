*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMAP_WBE_ODA....................................*
DATA:  BEGIN OF STATUS_ZMAP_WBE_ODA                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMAP_WBE_ODA                  .
CONTROLS: TCTRL_ZMAP_WBE_ODA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMAP_WBE_ODA                  .
TABLES: ZMAP_WBE_ODA                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
