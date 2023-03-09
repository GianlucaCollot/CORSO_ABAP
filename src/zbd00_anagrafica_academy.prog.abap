*&---------------------------------------------------------------------*
*& Report ZBD00_ANAGRAFICA_ACADEMY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbd00_anagrafica_academy.

PARAMETERS:
p_id TYPE zbd00_academy23-id_partecipante.

DATA:
  ls_anagrafica TYPE zbd00_academy23,
  lv_eta        TYPE n LENGTH 2,
  lv_mi         TYPE i,
  lv_ve         TYPE i,
  lv_rm         TYPE i.

SELECT SINGLE nome cognome FROM zbd00_academy23 INTO (ls_anagrafica-nome, ls_anagrafica-cognome)
  WHERE id_partecipante = p_id.



WRITE: /, / |------------------------------------------------  Requisito 1 ---------------------|.
WRITE: / 'anagrafica selezionata:', p_id.
WRITE: / |Nome: { ls_anagrafica-nome } Cognome: { ls_anagrafica-cognome }|.


WRITE: /, / |------------------------------------------------  Requisito 2 ---------------------|.

lv_eta = sy-datum(4) - ls_anagrafica-data_di_nascita(4).
WRITE: / |Età: { lv_eta }|.


WRITE: /, / |------------------------------------------------  Requisito 3 ---------------------|.

SELECT COUNT(*) FROM zbd00_academy23 INTO lv_mi
  WHERE ccelera = 'MI'.

WRITE: / |Partecipanti su sede MI: { lv_mi }|.

SELECT COUNT(*) FROM zbd00_academy23 INTO lv_ve
  WHERE ccelera = 'VE'.

WRITE: / |Partecipanti su sede VE: { lv_ve }|.

SELECT COUNT(*) FROM zbd00_academy23 INTO lv_rm
  WHERE ccelera = 'RM'.

WRITE: / |Partecipanti su sede RM: { lv_rm }|.


WRITE: /, / |------------------------------------------------  Requisito 4 ---------------------|.
TYPES: BEGIN OF ty_eta,
         id_partecipante TYPE zbd00_academy23-id_partecipante,
         data_di_nascita TYPE zbd00_academy23-data_di_nascita,
       END OF ty_eta.

DATA:
  lt_eta              TYPE TABLE OF ty_eta,
  ls_eta              TYPE ty_eta,
  lv_somma            TYPE i,
  lv_tot_partecipanti TYPE i,
  lv_media            TYPE p LENGTH 4 DECIMALS 2.

SELECT id_partecipante data_di_nascita FROM zbd00_academy23 INTO CORRESPONDING FIELDS OF TABLE lt_eta.

LOOP AT lt_eta INTO ls_eta.
  lv_eta = sy-datum(4) - ls_eta-data_di_nascita(4).
  ADD lv_Eta TO lv_somma.
ENDLOOP.

lv_tot_partecipanti = lines( lt_eta ).

lv_media = lv_somma / lv_tot_partecipanti.

WRITE: / |Età media dei partecipanti: { lv_media }|.

*PARAMETERS:
*  p_nome  TYPE name_first,
*  cognome TYPE name,
*  data    TYPE zbd00_academy23-data_di_nascita,
*  LUOGo   TYPE zbd00_academy23-luogo_di_nascita,
*  sede    TYPE zbd00_academy23-ccelera.
*
*DATA:
*      ls_anagrafica TYPE zbd00_academy23.   "dichiaro il modello di entità da inserire in tabella
*
*ls_anagrafica-nome = p_nome.
*ls_anagrafica-cognome = cognome.
*ls_anagrafica-data_di_nascita = data.
*ls_anagrafica-luogo_di_nascita = luogo.
*ls_anagrafica-ccelera = sede.
*
*ls_anagrafica-id_partecipante = 'BD02'.   "fisso in questo momento, da gestire valore incrementale!!!
*
**INSERT zbd00_academy23 FROM ls_anagrafica.
*
*MODIFY zbd00_academy23 FROM ls_anagrafica.
