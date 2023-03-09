FUNCTION zbd09_media.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     VALUE(IT_LISTA_NUMERI) TYPE  ZBD09_TYPE_TABLE
*"  EXPORTING
*"     VALUE(MEDIA) TYPE  DECFLOAT34
*"  EXCEPTIONS
*"      EMPTY_TAB
*"      ONE_VALUE
*"----------------------------------------------------------------------


IF lines( it_lista_numeri ) = 0 .
  RAISE empty_tab.
ENDIF.
IF lines( it_lista_numeri ) = 1.
  RAISE one_value.
ENDIF.
DATA: somma TYPE decfloat34.
somma = 0.

**CALL FUNCTION 'ZBD04_SOMMAN'
** EXPORTING
**   IV_TABELLA       = it_lista_numeri
** IMPORTING
**   EV_SOMMA         = somma
*
*
*          .
*
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
LOOP AT it_lista_numeri INTO DATA(temp).
  somma = somma + temp.
ENDLOOP.

DATA(factors) = lines( it_lista_numeri ).


CALL FUNCTION 'ZBD09_DIVISION'
  EXPORTING
    iv_fattore1                  = somma
    iv_fattore2                  = factors
 IMPORTING
   EV_FATTORE                   = media
 EXCEPTIONS
   IV_FATTORE2_EQUAL_TO_0       = 1
*   OTHERS                       = 2
          .

IF sy-subrc <> 0.
    WRITE / |Il secondo fattore è zero, impossibile fare la divisione|.

ENDIF.


ENDFUNCTION.
