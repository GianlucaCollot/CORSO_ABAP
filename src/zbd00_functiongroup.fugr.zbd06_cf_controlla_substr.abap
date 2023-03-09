FUNCTION zbd06_cf_controlla_substr.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(STRINGA) TYPE  STRING
*"     REFERENCE(CONTROLLO) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(VERIFICA) TYPE  BOOL
*"----------------------------------------------------------------------

  verifica = abap_false.
  DATA:
    count       TYPE i VALUE 0,
    scorrimento TYPE i VALUE 1.

  DO strlen( stringa ) TIMES.
    IF stringa+sy-index(1) = controllo+scorrimento(1).
      count += 1.
    ENDIF.
    scorrimento += 1.
  ENDDO.

ENDFUNCTION.
