CLASS zcl_gs_load_store_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.





  CLASS zcl_gs_load_store_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_store TYPE TABLE OF zgs_store.
    DATA ls_store TYPE zgs_store.

    "Delete existing stores
    DELETE FROM zgs_store.

    "Store 1
    CLEAR ls_store.
    ls_store-client = sy-mandt.
    ls_store-store_id = 'ST001'.
    ls_store-store_name = 'Aldi'.
    APPEND ls_store TO lt_store.

    "Store 2
    CLEAR ls_store.
    ls_store-client = sy-mandt.
    ls_store-store_id = 'ST002'.
    ls_store-store_name = 'Lidl'.
    APPEND ls_store TO lt_store.

    "Store 3
    CLEAR ls_store.
    ls_store-client = sy-mandt.
    ls_store-store_id = 'ST003'.
    ls_store-store_name = 'Kaufland'.
    APPEND ls_store TO lt_store.

    "Store 4
    CLEAR ls_store.
    ls_store-client = sy-mandt.
    ls_store-store_id = 'ST004'.
    ls_store-store_name = 'Rewe'.
    APPEND ls_store TO lt_store.

    "Store 5
    CLEAR ls_store.
    ls_store-client = sy-mandt.
    ls_store-store_id = 'ST005'.
    ls_store-store_name = 'Edeka'.
    APPEND ls_store TO lt_store.

    INSERT zgs_store FROM TABLE @lt_store.

    COMMIT WORK.

    out->write( '=====================================' ).
    out->write( 'Store Demo Data Loaded Successfully' ).
    out->write( 'Total Stores Loaded: 5' ).
    out->write( '=====================================' ).

  ENDMETHOD.

ENDCLASS.
