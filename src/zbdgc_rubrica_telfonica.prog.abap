*&---------------------------------------------------------------------*
*& Report zbdgc_rubrica_telfonica
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_rubrica_telefonica.

DATA: BEGIN OF voce_elenco,
        id      TYPE i,
        nome    TYPE text20,
        cognome TYPE text20,
        numero  TYPE text20,
      END OF voce_elenco.

DATA: voce2 LIKE voce_elenco.

DATA: elenco LIKE TABLE OF voce_elenco.

voce_elenco-id = 1.
voce_elenco-nome = 'Gianluca'.
voce_elenco-cognome = 'Collot'.
voce_elenco-numero = '+39 345 1234567'.
WRITE: / voce_elenco-id, voce_elenco-nome , voce_elenco-cognome, voce_elenco-numero.
APPEND voce_elenco TO elenco.
APPEND voce_elenco TO elenco.

voce2-id = 1.
voce2-nome = 'Mattia'.
voce2-cognome = 'Rossi'.
voce2-numero = '+39 654 5234567'.
APPEND voce2 TO elenco.

WRITE: / voce2-id, voce2-nome , voce2-cognome, voce2-numero.

voce2 = voce_elenco.
WRITE: / voce2-id, voce2-nome , voce2-cognome, voce2-numero.

cl_demo_output=>display( elenco ).
