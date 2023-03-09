*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBD00_ACADEMY23.................................*
DATA:  BEGIN OF STATUS_ZBD00_ACADEMY23               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBD00_ACADEMY23               .
CONTROLS: TCTRL_ZBD00_ACADEMY23
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBD00_ACADEMY23               .
TABLES: ZBD00_ACADEMY23                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
