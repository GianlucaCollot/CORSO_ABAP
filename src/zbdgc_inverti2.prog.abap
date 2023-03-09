*&---------------------------------------------------------------------*
*& Report zbdgc_inverti2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_inverti2.

PARAMETERS p_testo TYPE string LOWER CASE DEFAULT 'Le montagne sono alte'.
DATA: gt_parole TYPE TABLE OF string,
      output    like p_testo.

WRITE / |Il testo da elaborare è "{ p_testo }"|.
SPLIT p_testo AT ' ' INTO TABLE gt_parole.

LOOP AT gt_parole INTO DATA(parola).
  WRITE / |La parola originale è "{ parola }"|.
  IF parola = 'skip'.
    CONTINUE.
  ENDIF.
  IF parola = 'exit'.
    EXIT.
  ENDIF.
  PERFORM inverti CHANGING parola.
  WRITE / |La parola invertita è "{ parola }"|.
  CONCATENATE output parola INTO output SEPARATED BY space.

ENDLOOP.

WRITE / |La frase elaborata è "{ output }"|.


FORM inverti CHANGING p_testo TYPE string.
  DATA: output TYPE string.
  DATA(lunghezza) = strlen( p_testo ).

*  WRITE / |La lunghezza del testo è { lunghezza }|.

  DO ( lunghezza ) TIMES.
** ALTERNATIVA cn la psizione che scorre all indietro
* DATA(posizione) = ( lunghezza - sy-index ).
* DATA(lettera) = p_testo+posizione(1).
* WRITE / |La lettera selzionata è "{ lettera }"|.
* CONCATENATE output lettera INTO output.

    DATA(posizione) = ( sy-index - 1 ).
    DATA(lettera) = p_testo+posizione(1).
*  WRITE / |La lettera selzionata è "{ lettera }"|.
    CONCATENATE lettera output INTO output.
*  output = lettera && output. "EQUIVALENTE
    "concateno mettendo la lettera davanti alle precedenti
  ENDDO.
  p_testo = output.

ENDFORM.
