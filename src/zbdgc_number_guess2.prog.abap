*&---------------------------------------------------------------------*
*& Modulpool ZBDGC_NUMBER_GUESS2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM zbdgc_number_guess2.
DATA: okcode        TYPE sy-ucomm,
      secret_number TYPE int4,
      guess         TYPE int4,
      init          TYPE flag VALUE 'X',
      testo         TYPE text40,
      lo_rand       TYPE REF TO cl_abap_random.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE okcode.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'TRY'.
      IF guess = secret_number.
        call SCREEN 200.
      ENDIF.
      IF guess < secret_number.
        testo = 'Prova un numero più alto'.
      ENDIF.
      IF guess > secret_number.
        testo = 'Prova un numero più basso'.
      ENDIF.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module INIT_100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE init_100 OUTPUT.
  SET PF-STATUS 'MYSTATUS'.
  IF init = 'X'.
* Genero il primo numero casuale.
    " Create instance with factory
    lo_rand = cl_abap_random=>create( seed = CONV #( sy-uzeit ) ).
    secret_number = lo_rand->intinrange( low = 1 high = 100 ).
    testo = 'Indovina il numero'.
    CLEAR init.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE sy-ucomm.
    WHEN 'SI'.
      secret_number = lo_rand->intinrange( low = 1 high = 100 ).
      CALL SCREEN 100.
    WHEN 'NO'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.
