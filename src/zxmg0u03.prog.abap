*&---------------------------------------------------------------------*
*& Include          ZXMG0U03
*&---------------------------------------------------------------------*

IF mmue2-mtart EQ 'ROH'.
  DATA(r) = cl_abap_random_int=>create( seed = CONV i( sy-uzeit )
                                      min  = 1
                                      max = 100000 ).
  DATA(val) = r->get_next( ).
  matnr = |{ 'ROH' }{ CONV string( val ) }|.
ENDIF.
