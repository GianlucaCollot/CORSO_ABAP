CLASS zcl_bdgc_cliente_abs DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      factory IMPORTING iv_kunnr       TYPE kna1-kunnr
              RETURNING VALUE(cliente) TYPE REF TO zcl_bdgc_cliente_abs.
    METHODS:
      constructor IMPORTING is_cliente TYPE zbdgc_clienti,
      blocca ABSTRACT,
      sblocca ABSTRACT,
      display,
      save.

  PROTECTED SECTION.
    DATA: ls_cliente TYPE zbdgc_clienti.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bdgc_cliente_abs IMPLEMENTATION.

  METHOD display.
*    cl_demo_output=>display( ls_cliente ).
    WRITE: /  ls_cliente-kunnr, '|',
             ls_cliente-importo_credito, ls_cliente-valuta, '|',
             ls_cliente-bloccato, '|', ls_cliente-vip,'|'.
  ENDMETHOD.
  METHOD save.
    MODIFY zbdgc_clienti FROM ls_cliente.
  ENDMETHOD.

  METHOD factory.
    DATA: ls_cliente TYPE zbdgc_clienti.
    SELECT SINGLE * FROM zbdgc_clienti
        INTO ls_cliente
        WHERE kunnr = iv_kunnr.

    IF ls_cliente-vip = abap_true.
      cliente = NEW zcl_bdgc_cliente_vip( ls_cliente ).
    ELSE.
      cliente = NEW zcl_bdgc_cliente_normale( ls_cliente ).
    ENDIF.
    RETURN.
  ENDMETHOD.

  METHOD constructor.
    ls_cliente = is_cliente.
  ENDMETHOD.

ENDCLASS.
