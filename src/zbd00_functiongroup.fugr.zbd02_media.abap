FUNCTION zbd02_media.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_NUMERI_MEDIA) TYPE  ZBD02_NUMERI OPTIONAL
*"  EXPORTING
*"     REFERENCE(EV_MEDIA) TYPE  PACKED12
*"     REFERENCE(EV_TESTO) TYPE  TEXT20
*"  EXCEPTIONS
*"      DIV_ZERO
*"----------------------------------------------------------------------
  DATA lv_somma LIKE ev_media.


  CALL FUNCTION 'ZBD02_SOMMA'
    EXPORTING
      it_numeri = it_numeri_media
    IMPORTING
      ev_somma  = lv_somma.
  DATA lv_tot_elementi LIKE LINE OF it_numeri_media.
  lv_tot_elementi = lines( it_numeri_media ).
  CALL FUNCTION 'ZBD02_DIVISIONE'
    EXPORTING
      iv_numeratore   = lv_somma
      iv_denominatore = lv_tot_elementi
    IMPORTING
      ev_risultato    = ev_media
    EXCEPTIONS
      div_by_zero     = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
    RAISE div_zero.
  ELSE.
    CALL FUNCTION 'ZBD00_SET_SOGLIA'
      EXPORTING
        iv_soglia = 5.

    PERFORM confronto_soglia
                            using ev_media
                            changing ev_testo.
  ENDIF.




ENDFUNCTION.
