FUNCTION zbd03_soglia.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(I_NUM) TYPE  INT4
*"  EXPORTING
*"     REFERENCE(SOGLIA) TYPE  STRING
*"----------------------------------------------------------------------

* in un' altra function puoi usare perform confronto_soglia
*  PERFORM confronto_soglia ....
ENDFUNCTION.


*using variabile in import, changing la variabile in export. La variabile globale è già utilizzabile senza chiamarla
FORM confronto_soglia_zbd03 USING i_num CHANGING soglia.
  IF i_num > gv_soglia.
    soglia = 'Alto'.
  ENDIF.
  IF i_num = gv_soglia.
    soglia = 'Uguale'.
  ENDIF.
  IF i_num < gv_soglia.
    soglia = 'Basso'.
  ENDIF.
ENDFORM.
