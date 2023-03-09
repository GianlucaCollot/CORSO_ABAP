*&---------------------------------------------------------------------*
*& Include zbdgc_data_examples_t
*&---------------------------------------------------------------------*

DATA lv_intero TYPE i.

DATA lv_intero2 LIKE lv_intero.
"Definisce un "tipo", un modello di dato, ma non crea lo spazio in memoria
" e non posso usarlo direttamente per assgnare valori.
TYPES: BEGIN OF ty_contatto,
         nome    TYPE char20,
         cognome TYPE char20,
         citta   TYPE char30,
         telno   TYPE char20,
         civico  TYPE i,
       END OF ty_contatto.

DATA: ls_contatto3 TYPE ty_contatto. "E' equivalente a quella sopra

DATA: lt_contatti LIKE TABLE OF ls_contatto3.
