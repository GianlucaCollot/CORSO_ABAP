FUNCTION ZBD04_DIVISIONE.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_NUM1) TYPE  /SRMSMC/TARGET_SCORE DEFAULT 0
*"     REFERENCE(IV_NUM2) TYPE  /SRMSMC/TARGET_SCORE DEFAULT 1
*"  EXPORTING
*"     REFERENCE(EV_MEDIA_F) TYPE  FEH_PE_TEST_DECFLOAT16
*"----------------------------------------------------------------------

ev_media_f = iv_num1 / iv_num2.



ENDFUNCTION.
