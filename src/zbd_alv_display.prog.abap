*&---------------------------------------------------------------------*
*& Report ZBD_ALV_DISPLAY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbd_alv_display.

DATA: gt_sspr TYPE TABLE OF string.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

** ALV
REFRESH it_fieldcat. CLEAR it_fieldcat[].

wa_fieldcat-fieldname  = 'PARTNER'.
wa_fieldcat-seltext_m  = 'Partner'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'NAME'.
wa_fieldcat-seltext_m  = 'Nome'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'SURNAME'.
wa_fieldcat-seltext_m  = 'Cognome'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'USERNAME'.
wa_fieldcat-seltext_m  = 'Username'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'MAIL'.
wa_fieldcat-seltext_m  = 'Mail'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'TELEPHONE'.
wa_fieldcat-seltext_m  = 'Telefono'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'DATE_INS'.
wa_fieldcat-seltext_m  = 'Data inserimento'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'ORA_INS'.
wa_fieldcat-seltext_m  = 'Ora inserimento'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'DATE_UPDATE'.
wa_fieldcat-seltext_m  = 'Data update'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

wa_fieldcat-fieldname  = 'ORA_UPDATE'.
wa_fieldcat-seltext_m  = 'Ora update'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR wa_fieldcat.

** Function module to display ALV list
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    it_fieldcat   = it_fieldcat
  TABLES
    t_outtab      = gt_sspr
  EXCEPTIONS
    program_error = 1
    OTHERS        = 2.
