*&---------------------------------------------------------------------*
*& Report ZBDGC_DYNPRO_CALC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_dynpro_calc.
DATA: output    TYPE int4,
      acc       TYPE int4,
      last_comm LIKE sy-ucomm,
      last_op   TYPE c.

CALL SCREEN 100.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  DATA temp TYPE string.
  IF last_comm CA '+-*/'.
    temp = 0.
  ELSE.
    temp = output.
  ENDIF.
  IF sy-ucomm CA '0123456789'.
    IF temp = 0.
      temp = sy-ucomm.
    ELSE.
      temp = temp * 10 + sy-ucomm.
    ENDIF.
*    CONCATENATE temp sy-ucomm INTO temp.
*    CONDENSE temp NO-GAPS.
    output = temp.
  ENDIF.


  CASE sy-ucomm.
      DATA(tmp_acc) = output.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN '+' OR '-' OR '*' OR '/'.
      PERFORM calc USING sy-ucomm(1).
    WHEN '='.
      PERFORM calc USING last_op.
  ENDCASE.
  acc = tmp_acc.
  last_comm = sy-ucomm.
ENDMODULE.

FORM calc USING op.
  CASE op.
    WHEN '+'.
      output += acc.
    WHEN '-'.
      output -= acc.
    WHEN '*'.
      output *= acc.
    WHEN '/'.
      output = output DIV acc.
  ENDCASE.
ENDFORM.
