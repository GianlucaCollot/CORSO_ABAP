FUNCTION ZBD03_MEDIA.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(TABELLA_NUMERI) TYPE  ZBD04_TABELLA_NUMERI
*"  EXPORTING
*"     REFERENCE(MEDIA) TYPE  INT4
*"  EXCEPTIONS
*"      DIVISIONE_0
*"----------------------------------------------------------------------




 if lines( tabella_numeri ) > 0.
   data sum type int4.

   loop at tabella_numeri into DATA(n).
   sum += n.
   endloop.

  media = sum / lines( tabella_numeri ).

 else.
    raise DIVISIONE_0.
 endif.

ENDFUNCTION.
