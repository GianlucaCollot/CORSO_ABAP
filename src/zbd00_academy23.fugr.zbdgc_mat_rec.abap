FUNCTION ZBDGC_MAT_REC.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CTU) LIKE  APQI-PUTACTIVE DEFAULT 'X'
*"     VALUE(MODE) LIKE  APQI-PUTACTIVE DEFAULT 'N'
*"     VALUE(UPDATE) LIKE  APQI-PUTACTIVE DEFAULT 'L'
*"     VALUE(GROUP) LIKE  APQI-GROUPID OPTIONAL
*"     VALUE(USER) LIKE  APQI-USERID OPTIONAL
*"     VALUE(KEEP) LIKE  APQI-QERASE OPTIONAL
*"     VALUE(HOLDDATE) LIKE  APQI-STARTDATE OPTIONAL
*"     VALUE(NODATA) LIKE  APQI-PUTACTIVE DEFAULT '/'
*"     VALUE(MATNR_001) LIKE  BDCDATA-FVAL DEFAULT 'ZMATGC_bb'
*"     VALUE(MBRSH_002) LIKE  BDCDATA-FVAL DEFAULT 'C'
*"     VALUE(MTART_003) LIKE  BDCDATA-FVAL DEFAULT 'FERT'
*"     VALUE(KZSEL_01_004) LIKE  BDCDATA-FVAL DEFAULT 'X'
*"     VALUE(MAKTX_005) LIKE  BDCDATA-FVAL DEFAULT 'Materiale per BI'
*"     VALUE(MEINS_006) LIKE  BDCDATA-FVAL DEFAULT 'PC'
*"     VALUE(GROES_007) LIKE  BDCDATA-FVAL DEFAULT 'Grande'
*"  EXPORTING
*"     VALUE(SUBRC) LIKE  SYST-SUBRC
*"  TABLES
*"      MESSTAB STRUCTURE  BDCMSGCOLL OPTIONAL
*"--------------------------------------------------------------------

subrc = 0.

perform bdc_nodata      using NODATA.

perform open_group      using GROUP USER KEEP HOLDDATE CTU.

perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MTART'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              MATNR_001.
perform bdc_field       using 'RMMG1-MBRSH'
                              MBRSH_002.
perform bdc_field       using 'RMMG1-MTART'
                              MTART_003.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(01)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              KZSEL_01_004.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'MAKT-MAKTX'
                              MAKTX_005.
perform bdc_field       using 'MARA-MEINS'
                              MEINS_006.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-GROES'.
perform bdc_field       using 'MARA-GROES'
                              GROES_007.
perform bdc_dynpro      using 'SAPLSPO1' '0300'.
perform bdc_field       using 'BDC_OKCODE'
                              '=YES'.
perform bdc_transaction tables messtab
using                         'MM01'
                              CTU
                              MODE
                              UPDATE.
if sy-subrc <> 0.
  subrc = sy-subrc.
  exit.
endif.

perform close_group using     CTU.





ENDFUNCTION.
INCLUDE BDCRECXY .
