*&---------------------------------------------------------------------*
*& Report ZBD_UPLOAD_DOWNLOAD_FILES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbd_upload_download_files.

DATA: gt_string  TYPE TABLE OF string,
      gt_academy TYPE TABLE OF zbd00_academy23,
      gs_academy TYPE zbd00_academy23,
      gv_file    TYPE string.

PARAMETERS: p_file TYPE localfile,
            p_upl  RADIOBUTTON GROUP rb1 DEFAULT 'X',
            p_dwn  RADIOBUTTON GROUP rb1,
            p_alv  TYPE char1 AS CHECKBOX DEFAULT 'X',
            p_test TYPE char1 AS CHECKBOX.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  CALL FUNCTION 'KD_GET_FILENAME_ON_F4'
    EXPORTING
      static    = 'X'
    CHANGING
      file_name = p_file.


START-OF-SELECTION.

  IF p_upl IS NOT INITIAL .
    IF p_file IS INITIAL.
      MESSAGE 'Inserire un percorso file' TYPE 'I'.
    ELSE.

      gv_file = p_file.

      CALL FUNCTION 'GUI_UPLOAD'
        EXPORTING
          filename                = gv_file
        TABLES
          data_tab                = gt_string
        EXCEPTIONS
          file_open_error         = 1
          file_read_error         = 2
          no_batch                = 3
          gui_refuse_filetransfer = 4
          invalid_type            = 5
          no_authority            = 6
          unknown_error           = 7
          bad_data_format         = 8
          header_not_allowed      = 9
          separator_not_allowed   = 10
          header_too_long         = 11
          unknown_dp_error        = 12
          access_denied           = 13
          dp_out_of_memory        = 14
          disk_full               = 15
          dp_timeout              = 16
          OTHERS                  = 17.

      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

      LOOP AT gt_string INTO DATA(gs_string).
        SPLIT gs_string AT ';' INTO
          gs_academy-id_partecipante
          gs_academy-nome
          gs_academy-cognome
          gs_academy-data_di_nascita
          gs_academy-luogo_di_nascita
          gs_academy-ccelera.

        APPEND gs_academy TO gt_academy.
        CLEAR gs_academy.

      ENDLOOP.
    ENDIF.
  ENDIF.

** Download
  IF p_dwn IS NOT INITIAL.
** Seleziono dati
** Download
    CLEAR: gt_string[], gt_academy[].
    SELECT  * FROM zbd00_academy23 INTO TABLE gt_academy.

    LOOP AT gt_academy INTO gs_academy.
      CONCATENATE gs_academy-id_partecipante
                  gs_academy-nome
                  gs_academy-cognome
                  gs_academy-data_di_nascita
                  gs_academy-luogo_di_nascita
                  gs_academy-ccelera
                  INTO gs_string SEPARATED BY ';'.

      APPEND gs_string TO gt_string. CLEAR gs_string.
    ENDLOOP.

    gv_file = p_file.
    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = gv_file
      TABLES
        data_tab                = gt_string
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.
  ENDIF.

  IF p_alv IS NOT INITIAL.
    PERFORM display_Alv.
  ENDIF.




**********
FORM display_ALV.
  DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
        wa_fieldcat TYPE slis_fieldcat_alv.

  REFRESH it_fieldcat.

  wa_fieldcat-fieldname  = 'NOME'.
  wa_fieldcat-seltext_m  = 'Nome'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname  = 'COGNOME'.
  wa_fieldcat-seltext_m  = 'Cognome'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname  = 'DATA_DI_NASCITA'.
  wa_fieldcat-seltext_m  = 'Data di Nascita'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname  = 'LUOGO_DI_NASCITA'.
  wa_fieldcat-seltext_m  = 'Luogo di Nascita'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname  = 'CCELERA'.
  wa_fieldcat-seltext_m  = 'Sede Ccelera'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat   = it_fieldcat
    TABLES
      t_outtab      = gt_academy
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.


ENDFORM.
