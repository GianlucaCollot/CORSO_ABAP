*&---------------------------------------------------------------------*
*& Report ZBDGC_CALCOLATRICE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_calcolatrice.

PARAMETERS: num1 TYPE i, " DEFAULT 15,
            num2 TYPE i DEFAULT 3,
            op   TYPE c OBLIGATORY DEFAULT '+'.

DATA: lv_result TYPE i.

CASE op.
  WHEN '+'.
    lv_result = num1 + num2.
    WRITE / |La somma di { num1 } e { num2 } è { lv_result }|.
  WHEN '-'.
    lv_result = num1 - num2.
    WRITE / |La differenza tra { num1 } e { num2 } è { lv_result }|.
  WHEN '*'.
    lv_result = num1 * num2.
    WRITE / |Il prodotto tra { num1 } e { num2 } è { lv_result }|.
  WHEN '/'.
    lv_result = num1 / num2.
    WRITE / |La divisione tra { num1 } e { num2 } è { lv_result }|.
ENDCASE.
num1 = lv_result.
