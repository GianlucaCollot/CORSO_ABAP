*&---------------------------------------------------------------------*
*& Report ZBDGC_DATETIME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_datetime.

PARAMETERS: p_data1  TYPE dats DEFAULT sy-datum,
            p_data2  TYPE d DEFAULT '20230515',

            p_giorni TYPE i DEFAULT 15.

WRITE: / |Hai inserito la data { p_data1 DATE = ENVIRONMENT }  il numero di giorni { p_giorni }|.

DATA(differenza) = p_data2 - p_data1.

WRITE: / | Mancano { differenza } giorni al { p_data2 DATE = ENVIRONMENT }|.

* Calcolo l'ultimo giorno del mse di P_DATA1
DATA(ultimo) = p_data1.

WRITE: / |Anno: { p_data1(4) }|.
WRITE: / |mese: { p_data1+4(2) }|.
WRITE: / |giorno: { p_data1+6(2) }|.

DATA(mese) = p_data1+4(2) + 1 .
IF mese = 13. mese = 1. ENDIF. "MOD 12.
ultimo+4(2) = mese.
ultimo+6(2) = '01'.
ultimo = ultimo - 1.
IF mese = 1.
  ultimo(4) = ultimo(4) + 1.
ENDIF.

WRITE: / |L'ultimo giorno del mese è { ultimo DATE = ENVIRONMENT }|.
