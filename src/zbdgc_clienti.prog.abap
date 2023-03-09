*&---------------------------------------------------------------------*
*& Report zbdgc_clienti
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_clienti.
DATA: gv_kunnr TYPE kna1-kunnr.

PARAMETERS:
  p_disp   RADIOBUTTON GROUP rad,
  p_blocca RADIOBUTTON GROUP rad,
  p_sblocc RADIOBUTTON GROUP rad.

SELECT-OPTIONS s_kunnr FOR gv_kunnr.

START-OF-SELECTION.
  CASE 'X'.
    WHEN p_disp.
      WRITE: / 'Modo visualizzazine.'.
    WHEN p_blocca.
      WRITE: / 'Blocco i Clienti:' COLOR COL_NEGATIVE.
    WHEN p_sblocc.
      WRITE: / 'Sblocco i Clienti:' COLOR COL_POSITIVE.
  ENDCASE.
  SELECT kunnr FROM zbdgc_clienti INTO TABLE @DATA(lt_kunnr)
          WHERE kunnr IN @s_kunnr.
  LOOP AT lt_kunnr INTO DATA(ls_kunnr).
    DATA(lo_cliente) = zcl_bdgc_cliente_abs=>factory( ls_kunnr-kunnr ).
    CASE 'X'.
      WHEN p_disp.
*        lo_cliente->display(  ).
*        zcl_bdgc_cliente_abs=>factory( ls_kunnr-kunnr )->display(  ). "Chiaining
      WHEN p_blocca.
        lo_cliente->blocca(  ).
        lo_cliente->save(  ).
      WHEN p_sblocc.
        lo_cliente->sblocca(  ).
        lo_cliente->save(  ).
    ENDCASE.
    lo_cliente->display(  ).
*    skip.
  ENDLOOP.
