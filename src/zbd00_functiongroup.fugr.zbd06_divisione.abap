FUNCTION zbd06_divisione.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(NUMERATORE) TYPE  FLOAT DEFAULT 1
*"     REFERENCE(DENOMINATORE) TYPE  FLOAT DEFAULT 1
*"  EXPORTING
*"     VALUE(RISULTATO) TYPE  FLOAT
*"  EXCEPTIONS
*"      ZERO_DIV
*"----------------------------------------------------------------------

  IF denominatore = 0.
    RAISE zero_div.
  ELSE.
    risultato = numeratore / denominatore.
  ENDIF.

ENDFUNCTION.
