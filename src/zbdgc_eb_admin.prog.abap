*&---------------------------------------------------------------------*
*& Report zbdgc_eb_admin
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_eb_admin.

DATA: ls_evento TYPE zbdgc_eb_evento.

PARAMETERS: p_titolo TYPE zbdgc_eb_evento-titolo DEFAULT 'Sagra di paese',
            p_descr  TYPE zbdgc_eb_evento-descrizione DEFAULT 'Festa paesana con chiosco',
            p_luogo  TYPE zbdgc_eb_evento-luogo DEFAULT 'Conegliano',
            p_prezzo TYPE zbdgc_eb_evento-prezzo DEFAULT 10,
            p_data_i TYPE zbdgc_eb_evento-data_inizio DEFAULT sy-datum,
            p_data_f TYPE zbdgc_eb_evento-data_fine DEFAULT '20230228',
            p_ora_in TYPE zbdgc_eb_evento-ora_inizio,
            p_ora_fi TYPE zbdgc_eb_evento-ora_fine DEFAULT '240000',
            p_catego TYPE zbdgc_eb_evento-categoria DEFAULT 3,
            p_num_bi TYPE zbdgc_eb_evento-num_biglietti DEFAULT 500.

PARAMETERS: p_ins  RADIOBUTTON GROUP rad DEFAULT 'X',
            p_del  RADIOBUTTON GROUP rad,
            p_mod  RADIOBUTTON GROUP rad,
            p_list RADIOBUTTON GROUP rad.
PARAMETERS: p_id TYPE zbdgc_eb_evento-id DEFAULT 1.

START-OF-SELECTION.
  CASE 'X'.
    WHEN p_ins.
      "Gestisco insrimento nuovo evento
      PERFORM prepara_evento CHANGING ls_evento.
      SELECT MAX( id ) FROM zbdgc_eb_evento INTO ls_evento-id.
      ls_evento-id += 1.
      INSERT zbdgc_eb_evento FROM ls_evento.

    WHEN  p_del.
      "Gestisco cancellazione evento
    WHEN    p_mod.
      PERFORM prepara_evento CHANGING ls_evento. "Qui ci sono in nuovi valri che ho inserito
      SELECT SINGLE * FROM zbdgc_eb_evento
                      INTO @DATA(ls_evento_old)
                      WHERE id = @p_id
                      .
      cl_demo_output=>write( ls_evento_old ).
      DESCRIBE FIELD ls_evento TYPE DATA(lv_type) COMPONENTS DATA(comps).

      DO comps TIMES.
        ASSIGN COMPONENT sy-index OF STRUCTURE ls_evento TO FIELD-SYMBOL(<evt_comp>).
        ASSIGN COMPONENT sy-index OF STRUCTURE ls_evento_old TO FIELD-SYMBOL(<evt_comp_old>).
*      write: / <evt_comp>, ' | ', <evt_comp_old>.
        IF <evt_comp> IS NOT INITIAL.
          <evt_comp_old> = <evt_comp>.
        ENDIF.
      ENDDO.
      UPDATE zbdgc_eb_evento FROM ls_evento_old.
      "Gestisco modifica evento
    WHEN    p_list.
      "visualizzo lista eventi
      "selezono tutti gli evnti della mia utenza
      SELECT * FROM zbdgc_eb_evento
               INTO TABLE @DATA(lt_eventi)
               WHERE owner = @sy-uname.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = DATA(lo_alv)
        CHANGING
          t_table      = lt_eventi ).
      "Display the ALV Grid
      "Enable default ALV toolbar functions
      lo_alv->get_functions( )->set_all( ).
      lo_alv->display( ).
  ENDCASE.

FORM prepara_evento CHANGING ps_evento TYPE zbdgc_eb_evento.
  ps_evento-titolo       =   p_titolo.
  ps_evento-descrizione  =   p_descr .
  ps_evento-luogo        =   p_luogo .
  ps_evento-prezzo       =   p_prezzo.
  ps_evento-data_inizio  =   p_data_i.
  ps_evento-data_fine    =   p_data_f.
  ps_evento-ora_inizio   =   p_ora_in.
  ps_evento-ora_fine     =   p_ora_fi.
  ps_evento-categoria    =   p_catego.
  ps_evento-num_biglietti =  p_num_bi.
  ps_evento-owner = sy-uname.
ENDFORM.
