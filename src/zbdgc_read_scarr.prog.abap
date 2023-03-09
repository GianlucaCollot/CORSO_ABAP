*&---------------------------------------------------------------------*
*& Report ZBDGC_READ_SCARR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_read_scarr.
TABLES: scarr,spfli. "DEPRECATO
*        Equivale a:
*data: scarr type scarr.
*
*SELECT * FROM scarr. "USA IMPLICITAMENTE la struttura con lo stesso nome ma è sconsigliato
*  WRITE: / scarr-carrname, scarr-carrid.
*ENDSELECT.

DATA: lt_scarr  TYPE TABLE OF scarr,
      ls_scarr2 LIKE LINE OF lt_scarr.

SELECT-OPTIONS: s_scarr FOR  ls_scarr2-carrid,
                s_spfli FOR spfli-connid.

DATA: BEGIN OF airline OCCURS 0, "Occurs è DEPRECATO
        "crea sia la tabella interna che la struttura con lo stesso nome
        carrid   TYPE s_carr_id,
        carrname TYPE scarr-carrname,
        currcode LIKE ls_scarr2-currcode,
*       URL
      END OF airline.

SELECT * FROM scarr
         WHERE carrid IN @s_scarr
         INTO TABLE @lt_scarr.

*cl_demo_output=>display( lt_scarr ).
LOOP AT lt_scarr INTO DATA(ls_scarr).
  MOVE-CORRESPONDING ls_scarr TO airline.
  APPEND airline.
  WRITE: / |Codice compagnia: { airline-carrid } - nome: { airline-carrname } |.
ENDLOOP.
ULINE.
WRITE: / 'Ora looppo sulla tabella interna con headerline'.
LOOP AT airline.
  WRITE: / |Codice compagnia: { airline-carrid } - nome: { airline-carrname } |.
ENDLOOP.
"Instantiation
*cl_salv_table=>factory(
*  IMPORTING
*    r_salv_table = DATA(lo_alv)
*  CHANGING
*    t_table      = lt_scarr ).
*  write: lines( lt_scarr ).
*"Enable default ALV toolbar functions
*lo_alv->get_functions( )->set_default( abap_true ).
"Do stuff
"...

"Display the ALV Grid
*lo_alv->display( ).
