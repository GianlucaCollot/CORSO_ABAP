FUNCTION zbd08_somma_n.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_TABELLA) TYPE  ZBD04_TABELLA_NUMERI
*"     REFERENCE(IV_SOGLIA) TYPE  /SRMSMC/TARGET_SCORE OPTIONAL
*"  EXPORTING
*"     REFERENCE(EV_SOMMA) TYPE  /SRMSMC/TARGET_SCORE
*"     REFERENCE(EV_SOGLIA) TYPE  /SCMTMS/UI_TEND_RESP_EVAL_RES
*"----------------------------------------------------------------------

  LOOP AT iv_tabella INTO DATA(numero).

    ev_somma = ev_somma + numero.


  ENDLOOP.

*PERFORM confronto_soglia USING ev_prodotto CHANGING ev_rispetto_a_soglia.


*    ev_soglia = 'alto'.
*  ENDIF.
*  IF ev_somma < gv_soglia.
*    ev_soglia = 'uguale'.
*  ELSE.
*  IF ev_somma > gv_soglia.
*    ev_soglia = 'basso'.
*  ENDIF.

ENDFUNCTION.
