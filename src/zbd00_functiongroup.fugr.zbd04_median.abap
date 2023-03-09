FUNCTION zbd04_median.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_NUMERI) TYPE  ZBD04_TABELLA_NUMERI OPTIONAL
*"  EXPORTING
*"     REFERENCE(EV_MEDIA) TYPE  FEH_PE_TEST_DECFLOAT16
*"  EXCEPTIONS
*"      DIV_ZERO
*"----------------------------------------------------------------------
  DATA: somma TYPE /srmsmc/target_score.
  DATA: elementi TYPE /srmsmc/target_score.

  CALL FUNCTION 'ZBD04_SOMMAN'
    EXPORTING
      iv_tabella = iv_numeri
    IMPORTING
      ev_somma   = somma.

  elementi = lines( iv_numeri ).
  IF elementi > 0.

    CALL FUNCTION 'ZBD04_DIVISIONE'
      EXPORTING
        iv_num1    = somma
        iv_num2    = elementi
      IMPORTING
        ev_media_f = ev_media.

  ELSE.

    RAISE div_zero.

  ENDIF.


ENDFUNCTION.
