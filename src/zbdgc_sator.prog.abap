*&---------------------------------------------------------------------*
*& Report zbdgc_sator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_sator.

PARAMETERS: p_file TYPE ibipparms-path DEFAULT 'C:\Users\candidato.VM-WIN11\Downloads\280000_parole_italiane.txt'.

DATA: filename     TYPE string,
      t_dizionario TYPE TABLE OF string.

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
    CHANGING
      data_tab                = t_dizionario
  ).

cl_demo_output=>display( t_dizionario ).
