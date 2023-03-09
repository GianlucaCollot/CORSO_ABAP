FUNCTION zmepobadiex_get_data.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_EBELN) TYPE  EBELN
*"  EXPORTING
*"     VALUE(EX_DATA) TYPE  ZZMEPO_STRUCT
*"----------------------------------------------------------------------

  CLEAR ex_data.

  READ TABLE gt_data INTO ex_data WITH TABLE KEY mandt = sy-mandt
                                                 ebeln = im_ebeln.
  IF NOT sy-subrc IS INITIAL.
    ex_data-mandt = sy-mandt.
    ex_data-ebeln = im_ebeln.
    SELECT SINGLE zzproject FROM ekko INTO @DATA(lv_project)
      WHERE ebeln EQ @im_ebeln.
    ex_data-zzproject = lv_project.
    INSERT ex_data INTO TABLE gt_data.
  ENDIF.

ENDFUNCTION.
