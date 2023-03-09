*&---------------------------------------------------------------------*
*& Report zdbgc_somma
*&---------------------------------------------------------------------*
*&Nome programma: ZBDxx_SOMMA.
*Descrizione: Somma nel Range.
*
*Definire 2 variabili intere v_start, v_end
*    assegnando un valore di default defnito da voi.
*Calcolare e stampare la somma di tutti i numeri da v_start a V_end
*    (incluse).
*
*v_start
*v_start + 1
*v_start + 2
*...
*v_end
*v_end - v_start + 1
*&---------------------------------------------------------------------*
REPORT zbdgc_somma.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS: lv_start TYPE i DEFAULT 10 OBLIGATORY, " Il numero iniziale
            lv_end   TYPE i DEFAULT 20 OBLIGATORY. " Il numero finale del range
SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN SKIP.
PARAMETERS: p_pari  RADIOBUTTON GROUP rad,
            p_disp  RADIOBUTTON GROUP rad,
            p_tutti RADIOBUTTON GROUP rad DEFAULT 'X',
            nessuno RADIOBUTTON GROUP rad.

PARAMETERS p_test as CHECKBOX.

DATA: lv_somma           TYPE i, " Variabile in cui accumulo le somme
      lv_loops           TYPE i, " Numero di somme da effettuare
      lv_prossimo_numero TYPE i.

lv_loops = lv_end - lv_start + 1. " Determino il numero di somme da effettare
lv_prossimo_numero = lv_start. " preparo il prossimo numero da sommare

WRITE: / |Parto da : { lv_start } arrivo a: { lv_end }|,
        | effettuo { lv_loops } somme|.

DO lv_loops TIMES. "ripeto le n somme
  CASE 'X'.
    WHEN p_disp.
      IF lv_prossimo_numero MOD 2 = 1.
        WRITE / |sommo { lv_prossimo_numero } a { lv_somma }|.
        ADD lv_prossimo_numero TO lv_somma. "effettuo la somma
      ELSE.
        WRITE / |scarto { lv_prossimo_numero }|.
      ENDIF.

    WHEN p_pari.
      IF lv_prossimo_numero MOD 2 = 0.
        WRITE / |sommo { lv_prossimo_numero } a { lv_somma }|.
        ADD lv_prossimo_numero TO lv_somma. "effettuo la somma
      ELSE.
        WRITE / |scarto { lv_prossimo_numero }|.
      ENDIF.

    WHEN p_tutti.
      WRITE / |sommo { lv_prossimo_numero } a { lv_somma }|.
      ADD lv_prossimo_numero TO lv_somma. "effettuo la somma
  ENDCASE.
  ADD 1 TO lv_prossimo_numero. "Incremento il prossimo numero

ENDDO.

* Stampo il risultato
WRITE / |La somma dei numeri da { lv_start } a { lv_end } è: { lv_somma }|.
