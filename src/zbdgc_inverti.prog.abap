*&---------------------------------------------------------------------*
*& Report ZBDGC_INVERTI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_inverti.

PARAMETERS: testo TYPE string DEFAULT 'ciao amico verde' LOWER CASE.
DATA: lt_parole TYPE TABLE OF string,
      testo2 type string.

WRITE: / |Hai inserito il testo: "{ testo }" di { strlen( testo ) } caratteri|.
REPLACE 'amico' INTO testo WITH space.
REPLACE ALL OCCURRENCES OF REGEX '[ ]+' IN testo WITH ''.
*CONDENSE testo no-GAPS.
WRITE: / |Hai ottenuto il testo: "{ testo }" di { strlen( testo ) } caratteri|.

*SPLIT testo AT ' ' INTO TABLE lt_parole.
*
*LOOP AT lt_parole INTO DATA(lv_parola).
*  PERFORM inverti_parola CHANGING lv_parola.
*  CONCATENATE testo2 lv_parola INTO testo2 SEPARATED BY space.
*ENDLOOP.

PERFORM inverti_parola CHANGING testo.
WRITE: |il testo invertito è { testo }|.








FORM inverti_parola CHANGING parola TYPE string.
  DATA: output  TYPE string,
        lettera TYPE string.
  DATA(lunghezza) = strlen( parola ).
*  WRITE: |Hai inserito la testo: "{ parola }" di { strlen( parola ) } caratteri|.

  DO lunghezza TIMES.
    DATA(posizione) = lunghezza - sy-index.
    lettera = parola+posizione(1).
    output =  output && lettera.
  ENDDO.
  parola = output.
ENDFORM.
