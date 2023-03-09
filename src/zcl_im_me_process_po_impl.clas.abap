class ZCL_IM_ME_PROCESS_PO_IMPL definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_ME_PROCESS_PO_CUST .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_ME_PROCESS_PO_IMPL IMPLEMENTATION.


  method IF_EX_ME_PROCESS_PO_CUST~CHECK.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~CLOSE.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_HEADER.
    DATA:
    l_changeable          TYPE mmpur_bool.

  FIELD-SYMBOLS:
    <fs>                  LIKE LINE OF ch_fieldselection.

* Is PO changeable?
  l_changeable = im_header->is_changeable( ).

  LOOP AT ch_fieldselection ASSIGNING <fs>.
    IF l_changeable IS INITIAL.
      <fs>-fieldstatus = '*'. " Display
    ELSE.
      <fs>-fieldstatus = '+'. " Change
    ENDIF.
  ENDLOOP.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_HEADER_REFKEYS.
  endmethod.


  METHOD if_ex_me_process_po_cust~fieldselection_item.
  ENDMETHOD.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_ITEM_REFKEYS.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~INITIALIZE.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~OPEN.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~POST.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_ACCOUNT.
  endmethod.


  METHOD if_ex_me_process_po_cust~process_header.

*    DATA: lwa_mepoheader TYPE mepoheader.
*
*    CALL METHOD im_header->get_data
*      RECEIVING
*        re_data = lwa_mepoheader.
*
*    SELECT SINGLE fiscal_year FROM zzmepo_struct
*    INTO @lwa_mepoitem-zzproject
*    WHERE ebeln = @lwa_mepoitem-ebeln.
*
*    IF sy-subrc EQ 0 AND lwa_mepoitem-zzproject IS NOT INITIAL.
*      CALL METHOD im_item->set_data
*        EXPORTING
*          im_data = lwa_mepoitem.
*
*    ENDIF.

  ENDMETHOD.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_ITEM.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_SCHEDULE.
  endmethod.
ENDCLASS.
