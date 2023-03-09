*&---------------------------------------------------------------------*
*& Report zbdgc_table_examples
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_table_examples.

DATA: BEGIN OF gs_voce_elenco,
        id      TYPE i,
        nome    TYPE text20,
        cognome TYPE text20,
        numero  TYPE text20,
      END OF gs_voce_elenco.

DATA: gs_voce2 LIKE gs_voce_elenco.

DATA: gt_rubrica LIKE TABLE OF gs_voce_elenco.


**********************************************************************
** Alimento la tabella
gs_voce_elenco-id = 1.
gs_voce_elenco-nome = 'Gianluca'.
gs_voce_elenco-cognome = 'Collot'.
gs_voce_elenco-numero = '+39 345 1234567'.
cl_demo_output=>write( gs_voce_elenco ).
APPEND gs_voce_elenco TO gt_rubrica.    "aggingo una riga alla tabella
gs_voce_elenco-id = 2.
APPEND gs_voce_elenco TO gt_rubrica.
gs_voce2-id = 3.
gs_voce2-nome = 'Mattia'.
gs_voce2-cognome = 'Rossi'.
gs_voce2-numero = '+39 654 5234567'.
APPEND gs_voce2 TO gt_rubrica.
gs_voce2-id = 4.
gs_voce2-nome = 'Giorgio'.
gs_voce2-cognome = 'Verdi'.
gs_voce2-numero = '+39 123 5234888'.
APPEND gs_voce2 TO gt_rubrica.
gs_voce2-id = 5.
gs_voce2-nome = 'Paola'.
gs_voce2-cognome = 'Mandelli'.
gs_voce2-numero = '+39 8888 5245567'.
APPEND gs_voce2 TO gt_rubrica.

append VALUE #( id = 1
                nome = 'Roberta'
                cognome = 'Rossi'
                numero = '1254654' ) to gt_rubrica.

cl_demo_output=>write( 'APPEND gs_voce2 TO gt_rubrica.' ).
APPEND gs_voce2 TO gt_rubrica.

cl_demo_output=>write( gt_rubrica ).

INSERT gs_voce2 INTO gt_rubrica INDEX 2.
cl_demo_output=>write( gt_rubrica ).

SORT gt_rubrica BY cognome DESCENDING.
cl_demo_output=>write( gt_rubrica ).


**********************************************************************
*** ACCESSI CON INDICE
**********************************************************************
** Leggo una riga della tabella (modo vecchio)
READ TABLE gt_rubrica INDEX 4 INTO gs_voce_elenco.
IF sy-subrc = 0.
  cl_demo_output=>write( gs_voce_elenco ).
ELSE.
  cl_demo_output=>write( 'gs_voce_elenco: risultato non trovato' ).
ENDIF.
**********************************************************************
** Leggo una riga della tabella (modo nuovo)
TRY.
    cl_demo_output=>write( gt_rubrica[ 4 ] ).
  CATCH cx_sy_itab_line_not_found INTO DATA(ex).
    cl_demo_output=>write( 'gs_voce_elenco: risultato non trovato' ).
ENDTRY.
**********************************************************************
** Cancello una riga
DELETE gt_rubrica INDEX 2.
cl_demo_output=>write( 'delete gt_rubrica INDEX 2.' ).
cl_demo_output=>write( gt_rubrica ).


**********************************************************************
**********************************************************************
** ACCESSI CON CHIAVE
** Leggo una riga della tabella (modo vecchio)
cl_demo_output=>begin_section( 'Accessi con chiave' ).
READ TABLE gt_rubrica WITH KEY nome = 'Paola' INTO gs_voce_elenco.
IF sy-subrc = 0.
  cl_demo_output=>write( gs_voce_elenco-cognome ).
ELSE.
  cl_demo_output=>write( 'gs_voce_elenco: risultato non trovato' ).
ENDIF.
**********************************************************************
** Leggo una riga della tabella (modo nuovo)
TRY.
    cl_demo_output=>write( gt_rubrica[ nome = 'Gianluca' ]-cognome ).
  CATCH cx_sy_itab_line_not_found INTO ex.
    cl_demo_output=>write( 'gs_voce_elenco: risultato non trovato' ).
ENDTRY.

**********************************************************************
** LOOP con condizione
cl_demo_output=>begin_section( 'LOOP con WHERE' ).
LOOP AT gt_rubrica INTO gs_voce2 WHERE cognome = 'Collot' and id = 7.
  cl_demo_output=>write( gs_voce2 ).
ENDLOOP.

cl_demo_output=>display(  ).
