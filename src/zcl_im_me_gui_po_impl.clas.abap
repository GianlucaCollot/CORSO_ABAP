class ZCL_IM_ME_GUI_PO_IMPL definition
  public
  final
  create public .

public section.
  type-pools MMMFD .

  interfaces IF_EX_ME_GUI_PO_CUST .

  constants SUBSCREEN1 type MEPO_NAME value 'ITEMSCREEN1' ##NO_TEXT.
protected section.
private section.

  data DYNP_DATA_PBO type CI_EKKODB .
  data DYNP_DATA_PAI type CI_EKKODB .
ENDCLASS.



CLASS ZCL_IM_ME_GUI_PO_IMPL IMPLEMENTATION.


  method IF_EX_ME_GUI_PO_CUST~EXECUTE.
  endmethod.


  METHOD if_ex_me_gui_po_cust~map_dynpro_fields.
    FIELD-SYMBOLS: <mapping> LIKE LINE OF ch_mapping.
    LOOP AT ch_mapping ASSIGNING <mapping>.
      CASE <mapping>-fieldname.
        WHEN 'ZZPROJECT'.                     <mapping>-metafield = mmmfd_cust_03.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.


  METHOD if_ex_me_gui_po_cust~subscribe.
    DATA: ls_subscriber LIKE LINE OF re_subscribers.

* we want to add a customer subscreen on the item detail tab
    CHECK im_application = 'PO'.
    CHECK im_element     = 'HEADER'.

* each line in re_subscribers generates a subscreen. We add one subscreen in this example
    CLEAR re_subscribers[].
* the name is a unique identifier for the subscreen and defined in this class definition
    ls_subscriber-name = subscreen1.
* the dynpro number to use
    ls_subscriber-dynpro = '0002'.
* the program where the dynpro can be found
    ls_subscriber-program = 'SAPLZMEPOBADIEX'.
* each subscreen needs his own DDIC-Structure
    ls_subscriber-struct_name = 'ZZMEPO_STRUCT'.
* a label can be defined
    ls_subscriber-label = TEXT-001.
* the position within the tabstrib can be defined
    ls_subscriber-position = 5.
* the height of the screen can be defined here. Currently we suport two screen sizes:
* value <= 7 a sevel line subscreen
* value > 7  a 16 line subscreen
    ls_subscriber-height = 7.

    APPEND ls_subscriber TO re_subscribers.
  ENDMETHOD.


  METHOD if_ex_me_gui_po_cust~transport_from_dynp.
    CASE im_name.

      WHEN subscreen1.

        CALL FUNCTION 'ZMEPOBADIEX_POP'
          IMPORTING
            ex_dynp_data = dynp_data_pai.

        IF dynp_data_pai NE dynp_data_pbo.
* something has changed therefor we have to notify the framework
* to transport data to the model
          re_changed = mmpur_yes.
        ENDIF.

      WHEN OTHERS.

    ENDCASE.
  ENDMETHOD.


  METHOD if_ex_me_gui_po_cust~transport_from_model.
    DATA: l_header      TYPE REF TO if_purchase_order_mm,
          ls_mepoheader TYPE mepoheader,
          ls_customer   TYPE zzmepo_struct.
*--------------------------------------------------------------------*
* system asks to transport data from the business logic into the view
*--------------------------------------------------------------------*
    CASE im_name.
      WHEN subscreen1.
* is it an Header? im_model can be header or item.
        mmpur_dynamic_cast l_header im_model.
        CHECK NOT l_header IS INITIAL.
* transport standard fields
        ls_mepoheader = l_header->get_data( ).
* store info for later use
        MOVE-CORRESPONDING ls_mepoheader TO dynp_data_pbo.
      WHEN OTHERS.
* ...
    ENDCASE.
  ENDMETHOD.


  METHOD if_ex_me_gui_po_cust~transport_to_dynp.
    CASE im_name.

      WHEN subscreen1.

        CALL FUNCTION 'ZMEPOBADIEX_PUSH'
          EXPORTING
            im_dynp_data = dynp_data_pbo.

      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.


  METHOD if_ex_me_gui_po_cust~transport_to_model.
    DATA: l_header           TYPE REF TO if_purchase_order_mm,
          ls_mepoheader      TYPE mepoheader,
          ls_customer        TYPE zzmepo_struct,
          l_po_header_handle TYPE REF TO cl_po_header_handle_mm.
*--------------------------------------------------------------------*
* data have to be transported to business logic
*--------------------------------------------------------------------*
    CASE im_name.
      WHEN subscreen1.
* is it an item? im_model can be header or item.
        mmpur_dynamic_cast l_header im_model.
        CHECK NOT l_header IS INITIAL.
        ls_mepoheader = l_header->get_data( ).
        IF dynp_data_pbo-zzproject        NE dynp_data_pai-zzproject.

          CALL FUNCTION 'zmepobadiex_get_data'
            EXPORTING
              im_ebeln = ls_mepoheader-ebeln
            IMPORTING
              ex_data  = ls_customer.

          ls_customer-zzproject = dynp_data_pai-zzproject.

          CALL FUNCTION 'zmepobadiex_st_data'
            EXPORTING
              im_data = ls_customer.

          MOVE dynp_data_pai-zzproject TO ls_mepoheader-zzproject.

          CALL METHOD l_header->set_data
            EXPORTING
              im_data = ls_mepoheader.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
