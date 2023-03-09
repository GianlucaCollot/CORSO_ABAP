CLASS zcl_bdgc_cliente_normale DEFINITION
  INHERITING FROM zcl_bdgc_cliente_abs
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS blocca REDEFINITION.
    METHODS sblocca REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bdgc_cliente_normale IMPLEMENTATION.
  METHOD blocca.
    ls_cliente-bloccato = 'X'.
    ls_cliente-importo_credito = 0.
*    write: 'NOR: Ho bloccato il cliente e azzerato il credito'.
  ENDMETHOD.

  METHOD sblocca.
    CLEAR ls_cliente-bloccato.
*    write: 'NOR: ho sbloccato il cliente'.
  ENDMETHOD.

ENDCLASS.
