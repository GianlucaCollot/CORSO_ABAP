*&---------------------------------------------------------------------*
*& Report zbdgc_prime_numbers
*&---------------------------------------------------------------------*
*&Programma: ZBCxx_PRIME_NUMBERS
*Descrizione: stampa i numeri primi
*
*SELEZIONE
*campo "Fino a": Il limite massimo su cui testare
*
*Logica
*Il programma
*elabora in sequenza tutti i numeri fino al massimo indicato in selezione.
*Verifica se ciascun numero è primo e lo stampa in output.
*
*Varianti Avanzate
*- memorizza in una tabella interna tutti i numeri primi determinati precedentemente
*- Testa se il numero è primo controllando la divisione solo per i numeri primi già determinati
*- trasformo il test in una form
*- Stampo tutti i numeri e dico se primo o meno
*    - stampo il primo divisore trovato
*    - stampo tutti i divisori
*
*Ottimizzazioni:
*- potete testare la divisione solo fino al primo inferiore
*
*Radice quadrata: sqrt( num )
*quante righe ha una tabella: lines( itab )
*&---------------------------------------------------------------------*
REPORT zbdgc_prime_numbers.

PARAMETERS: p_max TYPE i.

DATA: result TYPE c.
DATA: gt_primes TYPE TABLE OF i.

DO p_max TIMES.
  DATA(numero) = sy-index.
  PERFORM is_prime USING numero CHANGING result.
  IF result IS INITIAL.
    WRITE: / |Il numero { numero } è primo!|.
    IF numero > 1.
      APPEND numero TO gt_primes.
    ENDIF.
  ENDIF.
  CLEAR result.
ENDDO.

cl_demo_output=>display( gt_primes ).

FORM is_prime USING numero_da_testare CHANGING non_primo.
  LOOP AT gt_primes INTO DATA(dividendo).
    IF numero_da_testare MOD dividendo = 0 AND dividendo <= sqrt( numero_da_testare ).
      WRITE / |Il numero { numero_da_testare } è divisibile per: |.
      PERFORM stampa_divisori USING numero_da_testare.
      non_primo = 'X'.
      EXIT.
    ENDIF.
  ENDLOOP.
ENDFORM.

FORM stampa_divisori USING numero_da_testare.
  LOOP AT gt_primes INTO DATA(dividendo).
    IF numero_da_testare MOD dividendo = 0.
      WRITE  |"{ dividendo }" |.
    ENDIF.
  ENDLOOP.
ENDFORM.
