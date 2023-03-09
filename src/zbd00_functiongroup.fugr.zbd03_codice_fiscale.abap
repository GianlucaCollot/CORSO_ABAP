FUNCTION zbd03_codice_fiscale.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(I_COD_FISC) TYPE  STRING
*"     REFERENCE(I_SEX) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(E_RISCONTRO) TYPE  STRING
*"----------------------------------------------------------------------

  DATA: i_cod_fisc_to_upper TYPE string.
  i_cod_fisc_to_upper = to_upper( i_cod_fisc ).
  e_riscontro = 'Il codice fiscale è corretto'.

*CONTROLLO LUNGHEZZA----------------------------------------------------------------------
  IF strlen( i_cod_fisc_to_upper ) <> 16.
    e_riscontro = |Il codice fiscale deve essere di 16 caratteri|.
  ENDIF.

* CONTROLLO SESSO----------------------------------------------------------------------
  IF i_cod_fisc_to_upper+9(2) < 1 OR i_cod_fisc_to_upper+9(2) > 71.
    e_riscontro = |Il codice della data (posizioni 10-11) non è valido|.
  ENDIF.

  IF i_cod_fisc_to_upper+9(2) <= 31 AND NOT i_sex = 'MALE'.
    e_riscontro = |Il codice del sesso (posizioni 10-11) non è valido|.
  ENDIF.

  IF i_cod_fisc_to_upper+9(2) > 31 AND NOT i_sex = 'FEMALE'.
    e_riscontro = |Il codice del sesso (posizioni 10-11) non è valido|.
  ENDIF.

*CONTROLLO NUMERI E LETTERE----------------------------------------------------------------------
  IF NOT i_cod_fisc_to_upper(6) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR i_cod_fisc_to_upper(6) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo lettere nelle prime 6 posizioni|.
  ENDIF.

  IF i_cod_fisc_to_upper+6(2) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR NOT i_cod_fisc_to_upper+6(2) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo numeri nelle posizioni 7-8|.
  ENDIF.

  IF NOT i_cod_fisc_to_upper+8(1) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR i_cod_fisc_to_upper+8(1) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo lettere nella posizione 9|.
  ENDIF.

  IF i_cod_fisc_to_upper+9(2) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR NOT i_cod_fisc_to_upper+9(2) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo numeri nelle posizioni 10-11|.
  ENDIF.

  IF NOT i_cod_fisc_to_upper+11(1) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR i_cod_fisc_to_upper+11(1) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo lettere nella 12esima posizione|.
  ENDIF.

  IF i_cod_fisc_to_upper+12(3) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR NOT i_cod_fisc_to_upper+12(3) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo numeri nelle posizioni 13-14-15|.
  ENDIF.

  IF NOT i_cod_fisc_to_upper+15(1) CO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' OR i_cod_fisc_to_upper+15(1) CO '0123456789'.
    e_riscontro = |Il codice fiscale deve contenere solo lettere nell'ultima posizione|.
  ENDIF.
ENDFUNCTION.
