CLASS zcl_bdgc_cliente_vip DEFINITION
  INHERITING FROM zcl_bdgc_cliente_abs
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS blocca REDEFINITION.
    METHODS sblocca REDEFINITION.
    METHODS display REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bdgc_cliente_vip IMPLEMENTATION.
  METHOD blocca.
    ls_cliente-bloccato = 'X'.
*    ls_cliente-importo_credito = 0. "Per i clienti vip nn azzero il credito
*    WRITE: 'VIP: Ho bloccato il cliente'.
  ENDMETHOD.

  METHOD sblocca.
    CLEAR ls_cliente-bloccato.
*    WRITE: 'VIP: Ho Sbloccato il cliente'.
  ENDMETHOD.

  METHOD display.
    super->display(  ).
    WRITE: 'VIP'.
  ENDMETHOD.

ENDCLASS.
