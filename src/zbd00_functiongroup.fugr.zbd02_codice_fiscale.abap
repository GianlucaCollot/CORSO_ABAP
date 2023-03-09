FUNCTION zbd02_codice_fiscale.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_COD_FISCALE) TYPE  ZBD02_CHAR16
*"     REFERENCE(IV_NOME) TYPE  TEXT45 OPTIONAL
*"     REFERENCE(IV_COGNOME) TYPE  TEXT45 OPTIONAL
*"     REFERENCE(IV_DATA_NASCITA) TYPE  /IWBEP/GWS_DATE_OF_BIRTH
*"       OPTIONAL
*"     REFERENCE(IV_LUOGO_NASCITA) TYPE  TEXT45 OPTIONAL
*"     REFERENCE(IV_SESSO) TYPE  ZBD02_SESSO OPTIONAL
*"  EXPORTING
*"     REFERENCE(EV_CF_VALIDO) TYPE  /ACCGO/E_BOOLEAN
*"     REFERENCE(EV_COMPLEANNO) TYPE  TEXT50
*"     REFERENCE(EV_CAMPI_VALIDI) TYPE  /ACCGO/E_BOOLEAN
*"  EXCEPTIONS
*"      TOO_SHORT
*"----------------------------------------------------------------------

  IF strlen( iv_cod_fiscale ) = 16.
    DATA(lv_alfabeto) = sy-abcde.
    DATA(lv_numeri) = '0123456789'.
    IF iv_cod_fiscale(6) CO lv_alfabeto
       AND iv_cod_fiscale+6(2) CO lv_numeri
       AND iv_cod_fiscale+8(1) CO lv_alfabeto
       AND iv_cod_fiscale+9(2) CO lv_numeri
       AND iv_cod_fiscale+11(1) CO lv_alfabeto
       AND iv_cod_fiscale+12(3) CO lv_numeri
       AND iv_cod_fiscale+15(1) CO lv_alfabeto.
      ev_cf_valido = abap_true.
      ev_campi_validi = abap_true.
      DATA lv_data_nascita TYPE string.

      IF iv_cod_fiscale+6(2) >= 0.
        lv_data_nascita = lv_data_nascita && '20' && iv_cod_fiscale+6(2).
      ELSE.
        lv_data_nascita = lv_data_nascita && '19' && iv_cod_fiscale+6(2).
      ENDIF.

      CASE iv_cod_fiscale+8(1).
        WHEN 'A'.
          lv_data_nascita = lv_data_nascita && '01'.
        WHEN 'B'.
          lv_data_nascita = lv_data_nascita && '02'.
        WHEN 'C'.
          lv_data_nascita = lv_data_nascita && '03'.
        WHEN 'D'.
          lv_data_nascita = lv_data_nascita &&'04'.
        WHEN 'E'.
          lv_data_nascita = lv_data_nascita && '05'.
        WHEN 'H'.
          lv_data_nascita = lv_data_nascita && '06'.
        WHEN 'L'.
          lv_data_nascita = lv_data_nascita && '07'.
        WHEN 'M'.
          lv_data_nascita = lv_data_nascita && '08'.
        WHEN 'P'.
          lv_data_nascita = lv_data_nascita && '09'.
        WHEN 'R'.
          lv_data_nascita = lv_data_nascita && '10'.
        WHEN 'S'.
          lv_data_nascita = lv_data_nascita && '11'.
        WHEN 'T'.
          lv_data_nascita = lv_data_nascita && '12'.
      ENDCASE.

      lv_data_nascita = lv_data_nascita && iv_cod_fiscale+9(2).

      IF lv_data_nascita+4(4) = sy-datum+4(4).
        ev_compleanno = 'Buon compleanno!'.
      ELSE.
        ev_compleanno = 'Non è il tuo compleanno!'.
      ENDIF.

      IF iv_nome IS NOT INITIAL AND ev_cf_valido = abap_true AND ev_campi_validi = abap_true.
        DATA lv_cons_nome TYPE zbd02_char3.
        CALL FUNCTION 'ZBD02_CONSONANTI'
          EXPORTING
            iv_parola     = iv_nome
          IMPORTING
            ev_consonanti = lv_cons_nome.
        IF iv_cod_fiscale+3(3) <> lv_cons_nome. ev_campi_validi = abap_false. ENDIF.
      ENDIF.

      IF iv_cognome IS NOT INITIAL AND ev_cf_valido = abap_true AND ev_campi_validi = abap_true.
        DATA lv_cons_cognome TYPE zbd02_char3.
        CALL FUNCTION 'ZBD02_CONSONANTI'
          EXPORTING
            iv_parola     = iv_cognome
          IMPORTING
            ev_consonanti = lv_cons_cognome.
        IF iv_cod_fiscale(3) <> lv_cons_cognome. ev_campi_validi = abap_false. ENDIF.

      ENDIF.

      IF iv_data_nascita IS NOT INITIAL AND ev_cf_valido = abap_true AND ev_campi_validi = abap_true.
        DATA lv_giorno_nascita TYPE i.
        lv_giorno_nascita = iv_cod_fiscale+9(2).
        IF lv_giorno_nascita > 40.
          lv_giorno_nascita -= 40.
        ENDIF.
        IF   iv_cod_fiscale+6(2) <> iv_data_nascita+2(2)
          OR iv_cod_fiscale+8(1) CN 'ABCDEHLMPRST'
          OR lv_giorno_nascita <>  iv_data_nascita+6(2).
          ev_cf_valido = abap_false.
        ELSEIF iv_cod_fiscale+8(1) CO 'ABCDEHLMPRST'.
          CASE iv_cod_fiscale+8(1).
            WHEN 'A'.
              IF iv_data_nascita+4(2) <> '01'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'B'.
              IF iv_data_nascita+4(2) <> '02'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'C'.
              IF iv_data_nascita+4(2) <> '03'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'D'.
              IF iv_data_nascita+4(2) <> '04'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'E'.
              IF iv_data_nascita+4(2) <> '05'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'H'.
              IF iv_data_nascita+4(2) <> '06'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'L'.
              IF iv_data_nascita+4(2) <> '07'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'M'.
              IF iv_data_nascita+4(2) <> '08'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'P'.
              IF iv_data_nascita+4(2) <> '09'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'R'.
              IF iv_data_nascita+4(2) <> '10'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'S'.
              IF iv_data_nascita+4(2) <> '11'. ev_campi_validi = abap_false. ENDIF.
            WHEN 'T'.
              IF iv_data_nascita+4(2) <> '12'. ev_campi_validi = abap_false. ENDIF.
          ENDCASE.
        ENDIF.
      ENDIF.

      IF iv_luogo_nascita IS NOT INITIAL AND ev_cf_valido = abap_true AND ev_campi_validi = abap_true.
*         non faccio niente xD
      ENDIF.

      IF iv_sesso IS NOT INITIAL AND ev_cf_valido = abap_true AND ev_campi_validi = abap_true.
        IF lv_giorno_nascita > 40 AND iv_sesso = 'M' OR lv_giorno_nascita < 40 AND iv_sesso = 'F' OR iv_sesso CN 'FM'.
          ev_campi_validi = abap_false.
        ENDIF.
      ENDIF.

    ELSE.
      ev_cf_valido = abap_false.
    ENDIF.
  ELSE.
    RAISE too_short.
  ENDIF.



ENDFUNCTION.
