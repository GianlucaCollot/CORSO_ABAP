FUNCTION ZBD10_SOTTRAZIONE.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_NUM1) TYPE  /SCMTMS/LSO_OPT_DIM_TYPE DEFAULT 1
*"     REFERENCE(IV_NUM2) TYPE  /SCMTMS/LSO_OPT_DIM_TYPE
*"  EXPORTING
*"     REFERENCE(RISULTATO) TYPE  /SCMTMS/LSO_OPT_DIM_TYPE
*"----------------------------------------------------------------------

risultato = iv_num1 - iv_num2.



ENDFUNCTION.
