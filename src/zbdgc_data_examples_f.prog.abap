*&---------------------------------------------------------------------*
*& Include zbdgc_data_examples_f
*&---------------------------------------------------------------------*

FORM visualizza_alv tables t_contatti STRUCTURE zbdgc_contatto USING p_fuctions .
* Non devo sporcare le tabelle in form che dichiarano di fare solo visualizzazione!!!
*  DATA: ls_contatto2 TYPE zbdgc_contatto.
*  ls_contatto2 = VALUE #( nome    = 'Dato'
*                          cognome = 'Sporco'
*                          citta   = 'Maledetto'
*                          telno   = '+3925647892' ).
*  APPEND ls_contatto2 TO t_contatti.
loop at t_contatti into data(ls_contatto).
ENDLOOP.
  cl_salv_table=>factory(
    IMPORTING
      r_salv_table = DATA(lo_alv)
    CHANGING
      t_table      = t_contatti[] ).
  "Display the ALV Grid
  IF p_fuctions = 'X'.
    "Enable default ALV toolbar functions
    lo_alv->get_functions( )->set_all( ).
  ENDIF.
  lo_alv->display( ).
ENDFORM.

FORM carica_dati.
  DATA: ls_contatto2 TYPE zbdgc_contatto.
  ls_contatto2 = VALUE #( nome    = 'Gianluca'
                          cognome = 'Collot'
                          citta   = 'Conegliano'
                          telno   = '+3925647892' ).
  APPEND ls_contatto2 TO lt_contatti.

  ls_contatto2 = VALUE #( nome    = 'Gianluca'
                          cognome = 'Collot'
                          citta   = 'Conegliano'
                          telno   = '+3925647892' ).
  APPEND ls_contatto2 TO lt_contatti.

  ls_contatto2 = VALUE #( nome    = 'Gianluca'
                          cognome = 'Collot'
                          citta   = 'Conegliano'
                          telno   = '+3925647892' ).
  APPEND ls_contatto2 TO lt_contatti.

  ls_contatto2 = VALUE #( nome    = 'Gianluca'
                          cognome = 'Collot'
                          citta   = 'Conegliano'
                          telno   = '+3925647892' ).
  APPEND ls_contatto2 TO lt_contatti.

ENDFORM.
