FUNCTION-POOL ZMEPOBADIEX.                   "MESSAGE-ID ..

* persistent data
DATA: gt_persistent_data TYPE SORTED TABLE OF ZZMEPO_STRUCT
                         WITH UNIQUE KEY mandt ebeln,

* actual data
      gt_data            TYPE SORTED TABLE OF ZZMEPO_STRUCT
                         WITH UNIQUE KEY mandt ebeln.

* dynpro output structure
TABLES: ZZMEPO_STRUCT.

* definitions required for dynpro/framework integration
DATA: ok-code TYPE sy-ucomm.
INCLUDE lmeviewsf01.
