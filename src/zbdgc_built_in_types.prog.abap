*&---------------------------------------------------------------------*
*& Report zbdgc_built_in_types
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_built_in_types.

DATA: v_int1  TYPE i VALUE 1456, "questo è un intero.
      v_int2  TYPE int4 VALUE 44456557, "intero a 4 byte
      v_num1  TYPE p LENGTH 10 DECIMALS 2, "Numerico di 10 caratteri
      v_char1 TYPE c LENGTH 100.

v_num1 = v_int1 + v_int2.

v_char1 = 'La somma di v_int1 e v_int2 è :' && v_num1.
WRITE v_char1.
ULINE.
v_num1 = v_int1 * v_int2.
v_char1 = 'Il prdotto di v_int1 e v_int2 è :' && v_num1.
WRITE v_char1.

DO 10 TIMES.
  WRITE: / 'Ciclo nr:', sy-index.
ENDDO.
