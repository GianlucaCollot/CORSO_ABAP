*&---------------------------------------------------------------------*
*& Report ZBDGC_HELLO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_hello.

* questo è un commento
*Questo è un programma di esempio
*Con cui faccio vedere agli studenti i commenti

DATA gv_nome TYPE string. "Definisco la variabile

gv_nome = ' ''Gianluca'''. "Assegno il valore alla variabile
data(gv_cognome) = 'Collot'.

WRITE 'Ciao'.
skip.
write  gv_nome .

skip.
uline.
*E' equivalente a questo:
write: 'Ciao', / gv_nome.

* Posso definire le variabili inline e concatenare con &&:
data(gv_line) = 'Ciao ' && gv_nome && '!'.
write / gv_line.
uline.



gv_line = |Ciao { gv_nome } { gv_cognome }!|.
write gv_line.
uline.
