*&---------------------------------------------------------------------*
*& Report ZBDGC_RC_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBDGC_RC_TEST.

data: results type table of tab512,
      opts type TABLE OF RFC_DB_OPT,
      fields type TABLE OF RFC_DB_fld.

CALL FUNCTION 'RFC_READ_TABLE' DESTINATION 'RFC_GC'
  EXPORTING
    query_table                = 'T000'
*   DELIMITER                  = ' '
*   NO_DATA                    = ' '
*   ROWSKIPS                   = 0
*   ROWCOUNT                   = 0
  tables
    options                    = opts
    fields                     = fields
    data                       = results
* EXCEPTIONS
*   TABLE_NOT_AVAILABLE        = 1
*   TABLE_WITHOUT_DATA         = 2
*   OPTION_NOT_VALID           = 3
*   FIELD_NOT_VALID            = 4
*   NOT_AUTHORIZED             = 5
*   DATA_BUFFER_EXCEEDED       = 6
*   OTHERS                     = 7
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

cl_demo_output=>display( results ).
