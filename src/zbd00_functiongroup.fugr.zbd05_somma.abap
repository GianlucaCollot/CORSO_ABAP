FUNCTION zbd05_somma.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUMBERS) TYPE  ZBD04_TABELLA_NUMERI
*"  EXPORTING
*"     REFERENCE(EV_SUM) TYPE  /SRMSMC/TARGET_SCORE
*"     REFERENCE(EV_THRESHOLD) TYPE  STRING
*"----------------------------------------------------------------------

  LOOP AT iv_numbers INTO DATA(number).

    ev_sum = ev_sum + number.

  ENDLOOP.

  PERFORM confronto_soglia  USING ev_sum
                            CHANGING ev_threshold.

*  IF ev_sum = gv_soglia.
*
*    ev_threshold = 'Same as threshold'.
*
*  ELSEIF ev_sum > gv_soglia.
*
*    ev_threshold = 'Bigger than threshold'.
*
*  ELSEIF ev_sum < gv_soglia.
*
*    ev_threshold = 'Smaller than threshold'.
*
*  ENDIF.



ENDFUNCTION.
