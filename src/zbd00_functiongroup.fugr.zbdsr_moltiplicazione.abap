FUNCTION zbdsr_moltiplicazione.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_FATTORE1) TYPE  /SRMSMC/TARGET_SCORE DEFAULT 1
*"     REFERENCE(IV_FATTORE2) TYPE  /SRMSMC/TARGET_SCORE
*"  EXPORTING
*"     REFERENCE(EV_PRODOTTO) TYPE  /SRMSMC/TARGET_SCORE
*"     REFERENCE(EV_RISPETTO_A_SOGLIA) TYPE  CHAR10
*"----------------------------------------------------------------------


  ev_prodotto = iv_fattore1 * iv_fattore2.

  PERFORM confronto_soglia USING ev_prodotto CHANGING ev_rispetto_a_soglia.



ENDFUNCTION.
