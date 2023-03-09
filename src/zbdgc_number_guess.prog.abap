*&---------------------------------------------------------------------*
*& Report ZBDGC_NUMBER_GUESS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_number_guess.

DATA lv_disp_num TYPE int4.
DATA secret_num TYPE int4.
DATA d_testo TYPE char40.

CALL SCREEN 100.

INITIALIZATION.
  " Create instance with factory
  DATA(lo_rand) = cl_abap_random=>create( seed = CONV #( sy-uzeit ) ).
  secret_num = lo_rand->intinrange( low = 1 high = 100 ).
  d_testo = 'Indovina il numero'.
*  lv_disp_num = secret_num.

  INCLUDE zbdgc_number_guess_user_comi01.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'MYSTATUS'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
