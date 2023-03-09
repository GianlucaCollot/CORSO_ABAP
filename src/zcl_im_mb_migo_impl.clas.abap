class ZCL_IM_MB_MIGO_IMPL definition
  public
  final
  create public .

public section.

  interfaces IF_EX_MB_MIGO_ITEM_BADI .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_MB_MIGO_IMPL IMPLEMENTATION.


  METHOD if_ex_mb_migo_item_badi~item_modify.
    e_item_text = |User { sy-uname }|.
    IF is_goitem-lgort EQ '0001'.
      e_stge_loc = '101A'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
