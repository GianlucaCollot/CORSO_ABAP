*&---------------------------------------------------------------------*
*& Report zbdgc_data_examples
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_data_examples.

INCLUDE zbdgc_data_examples_t.
PARAMETERS p_func as CHECKBOX.

START-OF-SELECTION.
  PERFORM carica_dati.
  PERFORM visualizza_alv TABLES lt_contatti using p_func .

INCLUDE zbdgc_data_examples_f.
