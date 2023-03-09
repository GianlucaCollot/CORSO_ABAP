*&---------------------------------------------------------------------*
*& Report zbdgc_file_process
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_file_process.

PARAMETERS: p_file TYPE ibipparms-path DEFAULT 'C:\Users\candidato.VM-WIN11\Documents\Esempio_file.csv'.

DATA: filename TYPE string,
      t_lines  TYPE TRUXS_T_TEXT_DATA.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  CALL FUNCTION 'F4_FILENAME'
*  EXPORTING
*    program_name  = SYST-CPROG
*    dynpro_number = SYST-DYNNR
*    field_name    = space
    IMPORTING
      file_name = p_file.

START-OF-SELECTION.
* Carico il file in una tabella di stringhe
  filename = p_file.
  cl_gui_frontend_services=>gui_upload(
    EXPORTING
      filename                = filename
      filetype                = 'ASC'
*      codepage                = '1160'
    CHANGING
      data_tab                = t_lines
  ).



  cl_demo_output=>display( t_lines ).

  OPEN DATASET 'testo.txt' FOR OUTPUT IN TEXT MODE ENCODING UTF-8.
*OPEN DATASET 'testo.txt' FOR OUTPUT IN LEGACY TEXT MODE CODE PAGE '1100'.

*  LOOP AT t_lines into data(lv_line).
*    TRANSFER lv_line TO 'testo.txt'.
*  ENDLOOP.
*  CLOSE DATASET 'testo.txt'.
  DATA: BEGIN OF LS_data ,
          id       TYPE text20,
          nome     TYPE text20,
          cognome  TYPE text20,
          eta      TYPE text20,
          telefono TYPE text20,
        END OF LS_data.

  DATA: T_DATA LIKE TABLE OF LS_DATA.


  CALL FUNCTION 'TEXT_CONVERT_TEX_TO_SAP'
    EXPORTING
      i_field_seperator    = ';'
      i_line_header        = 'X'
      i_tab_raw_data       = t_lines
*     i_filename           =
    TABLES
      i_tab_converted_data = t_data
  EXCEPTIONS
     conversion_failed    = 1
     others               = 2
    .
  IF sy-subrc <> 0.
 MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

  cl_demo_output=>display( t_data ).
