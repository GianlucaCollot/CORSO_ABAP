*&---------------------------------------------------------------------*
*& Report zbdgc_voli
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_voli.

PARAMETERS: p_from TYPE spfli-cityfrom DEFAULT 'ROME',
            p_to   TYPE spfli-cityto DEFAULT 'NEW-YORK'.

START-OF-SELECTION.

  "volo diretto
  SELECT * FROM spfli
                 INTO TABLE @DATA(lt_diretti)
    WHERE cityfrom = @p_from
      AND cityto = @p_to.

  LOOP AT lt_diretti INTO DATA(ls_diretto).
    WRITE: / ls_diretto-cityfrom, ' - ', ls_diretto-cityto.
  ENDLOOP.


  "voli 1 scalo
  SELECT * FROM spfli
                 INTO TABLE @DATA(lt_voli_daroma)
    WHERE cityfrom = @p_from.

  LOOP AT lt_voli_daroma INTO DATA(ls_volodaroma).

    SELECT * FROM spfli
                     INTO TABLE @DATA(lt_voli1scalo)
        WHERE cityfrom = @ls_volodaroma-cityto
          AND cityto = @p_to.

    LOOP AT lt_voli1scalo INTO DATA(ls_volo1scalo).
      WRITE: p_from, ' - ', ls_volo1scalo-cityfrom, ' - ', ls_volo1scalo-cityto.
    ENDLOOP.

  ENDLOOP.


*  DATA(found) = abap_false.
*  DATA: t_nodes TYPE TABLE OF spfli-cityto.
*  APPEND p_from TO t_nodes.
*
*  WHILE NOT found = abap_true.
*    SELECT * FROM spfli
*               INTO @data(ls_spfli)
*                 FOR ALL ENTRIES IN @t_nodes
*                 WHERE cityfrom = @t_nodes-table_line.
*      APPEND ls_spfli-cityto TO t_nodes.
*      DATA: LT_SPFLI TYPE TABLE OF SPFLI.
*      APPEND ls_spfli TO LT_SPFLI.
*    ENDSELECT.
*    READ TABLE t_nodes WITH KEY table_line = p_to TRANSPORTING NO FIELDS.
*    IF sy-subrc = 0.
*      found = abap_true.
*      EXIT.
*    ENDIF.
*  ENDWHILE.
*
*  SORT t_nodes.
*  DELETE ADJACENT DUPLICATES FROM t_nodes.
*
*  cl_demo_output=>display( LT_SPFLI ).
*  cl_demo_output=>display( t_nodes ).
