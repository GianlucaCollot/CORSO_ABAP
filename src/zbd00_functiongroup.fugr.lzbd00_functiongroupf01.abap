*----------------------------------------------------------------------*
***INCLUDE LZBD00_FUNCTIONGROUPF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form confronto_soglia
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> EV_PRODOTTO
*&      <-- EV_RISPETTO_A_SOGLIA
*&---------------------------------------------------------------------*
FORM confronto_soglia  USING    p_risultato
                       CHANGING p_confronto_soglia.

  IF p_risultato < gv_soglia.
    p_confronto_soglia = 'Basso'.
  ENDIF.

  IF p_risultato = gv_soglia.
    p_confronto_soglia = 'Pari'.
  ENDIF.

  IF p_risultato > gv_soglia.
    p_confronto_soglia = 'Alto'.
  ENDIF.

ENDFORM.
