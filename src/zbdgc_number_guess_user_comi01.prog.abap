*----------------------------------------------------------------------*
***INCLUDE ZBDGC_NUMBER_GUESS_USER_COMI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR '%EX' OR 'RW'.
      LEAVE PROGRAM.
    WHEN 'TRY'.
      IF lv_disp_num = secret_num.
        "Hai vinto
        d_testo =  'Hai vinto!'.
        secret_num = lo_rand->intinrange( low = 1 high = 100 ).
      ENDIF.
  ENDCASE.
ENDMODULE.
