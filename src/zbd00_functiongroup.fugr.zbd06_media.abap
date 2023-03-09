FUNCTION zbd06_media.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(NUMERI) TYPE  ZBD04_TABELLA_NUMERI
*"  EXPORTING
*"     VALUE(MEDIA) TYPE  BSI_ACYTDWS
*"----------------------------------------------------------------------

  IF lines( numeri ) = 0.
    media = 0.
  ELSE.
    media = 0.
    LOOP AT numeri INTO DATA(numero).
      media += numero.
    ENDLOOP.
    media /= lines( numeri ).
  ENDIF.

ENDFUNCTION.
