*&---------------------------------------------------------------------*
*& Report zbdgc_esercizio7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_esercizio7.

PARAMETERS input TYPE string DEFAULT '10,7,5,2,43,17,4,-15,-13,12.5'.

PARAMETERS: p_great RADIOBUTTON GROUP rad, "Determina il maggiore
            p_less  RADIOBUTTON GROUP rad, "Determina il minore
            p_mean RADIOBUTTON GROUP rad. "Determina la media

IF NOT input CO '0123456789,-.'.
  WRITE: 'Input non valido!' COLOR COL_NEGATIVE.
  EXIT.
ENDIF.

WRITE: |Valuto i numeri: "{ input }"|.

SPLIT input AT ',' INTO TABLE DATA(t_nums).

DATA: ultimo TYPE f VALUE 0.
* Se la tabella è vuota stampo errore e esco
IF lines( t_nums ) = 0.
  WRITE / 'Non è stato inserito nessun numero da valutare' color COL_NEGATIVE.
  EXIT.
ENDIF.

LOOP AT t_nums INTO DATA(numero_corrente).
  " Se il numero corrente è maggiore dei precedenti lo tngo com numero maggiore
  WRITE: / |Elaboro il numero { numero_corrente }|.
  CASE 'X'.
    WHEN p_great.
      WRITE |, il maggiore tra i precedenti è { ultimo }|.
      IF numero_corrente > ultimo
        OR sy-tabix = 1. "Al primo ciclo devo comunqe memorizzare il numero corrente
        ultimo = numero_corrente.
        WRITE: |il nuovo maggiore è { ultimo }| COLOR COL_POSITIVE.
      ENDIF.
    WHEN p_less.
      WRITE |, il minore tra i precedenti è { ultimo }|.
      IF numero_corrente < ultimo
        OR sy-tabix = 1. "Al primo ciclo devo comunqe memorizzare il numero corrente
        ultimo = numero_corrente.
        WRITE: |il nuovo minore è { ultimo }| COLOR COL_POSITIVE.
      ENDIF.
  ENDCASE.
ENDLOOP.


*IF sy-subrc <> 0.
*  WRITE / 'Non è stato inserito nessn numero da valutare'.
*  EXIT.
*ENDIF.
IF p_great = 'X'.
  WRITE / |il numero più grande è { ultimo }|.
ELSE.
  WRITE / |il numero più piccolo è { ultimo }|.
ENDIF.
