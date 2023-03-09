FUNCTION ZBD04_MOLTIPLICAZIONE.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_FATTORE1) TYPE  /SRMSMC/TARGET_SCORE DEFAULT 1
*"     REFERENCE(IV_FATTORE2) TYPE  /SRMSMC/TARGET_SCORE OPTIONAL
*"  EXPORTING
*"     REFERENCE(IV_PRODOTTO) TYPE  /SRMSMC/TARGET_SCORE
*"----------------------------------------------------------------------

iv_prodotto = iv_fattore1 * iv_fattore2.



ENDFUNCTION.
