FUNCTION ZMEPOBADIEX_POST.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_EBELN) TYPE  EBELN
*"----------------------------------------------------------------------

  DATA: ls_data LIKE LINE OF gt_data,
        lt_data_new TYPE STANDARD TABLE OF ZZMEPO_STRUCT,
        lt_data_old TYPE STANDARD TABLE OF ZZMEPO_STRUCT.

* prepare customers data for posting

  CHECK NOT im_ebeln IS INITIAL.

  lt_data_new[] = gt_data.
  lt_data_old[] = gt_persistent_data.
  ls_data-mandt = sy-mandt.
  ls_data-ebeln = im_ebeln.
  MODIFY lt_data_new FROM ls_data TRANSPORTING mandt ebeln WHERE ebeln IS initial.

  CALL FUNCTION 'ZMEPOBADIEX_COMMIT' IN UPDATE TASK
    TABLES
      imt_data_new = lt_data_new
      imt_data_old = lt_data_old.

ENDFUNCTION.
