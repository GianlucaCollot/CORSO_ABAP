FUNCTION zbd04_somman.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_TABELLA) TYPE  ZBD04_TABELLA_NUMERI OPTIONAL
*"     REFERENCE(IV_SOGLIA) TYPE  /SRMSMC/TARGET_SCORE OPTIONAL
*"  EXPORTING
*"     REFERENCE(EV_SOMMA) TYPE  /SRMSMC/TARGET_SCORE
*"     REFERENCE(EV_SOGLIA) TYPE  /CFG/DE_IMP_PHASE_TEXT
*"----------------------------------------------------------------------

  LOOP AT iv_tabella INTO DATA(numero).

    ev_somma = ev_somma + numero.

  ENDLOOP.

  "PERFORM confronto_soglia using ev_somma CHANGING ev_soglia.

  PERFORM confronto_soglia USING ev_somma CHANGING ev_soglia.
*
*  IF ev_somma >= gv_soglia.
*    ev_soglia = 'T'.
*  ELSE.
*    ev_soglia = 'F'.
*  ENDIF.

ENDFUNCTION.
