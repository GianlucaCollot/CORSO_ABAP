FUNCTION ZBD03_SOTTRAZIONE.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(N1) TYPE  INT4
*"     REFERENCE(N2) TYPE  INT4
*"  EXPORTING
*"     REFERENCE(RIS) TYPE  INT4
*"----------------------------------------------------------------------

*data: n1 type int4,
*      n2 type int4,
* data:     res type int4.

ris = n1 - n2.

ENDFUNCTION.
