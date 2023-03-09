FUNCTION ZMEPOBADIEX_OPEN.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_EBELN) TYPE  EBELN
*"--------------------------------------------------------------------

* read customer data from database

  CHECK NOT im_ebeln IS INITIAL.

  SELECT * FROM mepo_badi_exampl INTO TABLE gt_persistent_data
                                 WHERE ebeln = im_ebeln.

  gt_data = gt_persistent_data.

ENDFUNCTION.
