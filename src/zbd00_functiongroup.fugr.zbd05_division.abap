FUNCTION zbd05_division.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUMERATOR) TYPE  DECFLOAT34 DEFAULT 1
*"     REFERENCE(IV_DENOMINATOR) TYPE  DECFLOAT34 DEFAULT 1
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  DECFLOAT34
*"     REFERENCE(EV_THRESHOLD) TYPE  STRING
*"  EXCEPTIONS
*"      IV_RESULT_DENOMINATOR_ZERO
*"----------------------------------------------------------------------


  IF iv_denominator = 0.

    RAISE IV_result_denominator_zero.

  ELSE.
    ev_result = iv_numerator / iv_denominator.

  ENDIF.

  PERFORM confronto_soglia  USING ev_result
                            CHANGING ev_threshold.

ENDFUNCTION.
