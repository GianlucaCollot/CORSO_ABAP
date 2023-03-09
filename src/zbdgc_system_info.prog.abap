*&---------------------------------------------------------------------*
*& Report zbdgc_system_info
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_system_info.

WRITE:/ |Utente corrente: { sy-uname }|.
WRITE:/ |Data corrente: { sy-datum DATE = ENVIRONMENT }|.
WRITE:/ |Ora corrente: { sy-uzeit TIME = ENVIRONMENT }|.
WRITE:/ |Nome programma: { sy-repid }|.
WRITE:/ |Transazione corrente: { sy-tcode }|.
WRITE:/ |System ID corrente: { sy-sysid }|.
WRITE:/ |Mandante corrente: { sy-mandt }|.
WRITE:/ |Lingua corrente: { sy-langu }|.
