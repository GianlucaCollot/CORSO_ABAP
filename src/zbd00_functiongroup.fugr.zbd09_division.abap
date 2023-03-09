FUNCTION ZBD09_DIVISION.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_FATTORE1) TYPE  DECFLOAT34
*"     REFERENCE(IV_FATTORE2) TYPE  I
*"  EXPORTING
*"     VALUE(EV_FATTORE) TYPE  DECFLOAT34
*"  EXCEPTIONS
*"      IV_FATTORE2_EQUAL_TO_0
*"----------------------------------------------------------------------

IF iv_fattore2 = 0.

  RAISE IV_FATTORE2_EQUAL_TO_0.

ELSE.

  ev_fattore = iv_fattore1 / iv_fattore2.

ENDIF.



ENDFUNCTION.
