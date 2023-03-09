*&---------------------------------------------------------------------*
*& Report zbdgc_confronti
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbdgc_confronti.

PARAMETERS p_id type char10 DEFAULT '1'.

data: campo type char10.

      campo = p_id + 1 - 1.

      write: / campo.
      write: / p_id.

      if campo = p_id.
      WRITE / 'sono uguali'.
      else.
      WRITE / 'sono diversi'.
      endif.
