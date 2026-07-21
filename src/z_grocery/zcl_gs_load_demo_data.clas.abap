CLASS zcl_gs_load_demo_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_gs_load_demo_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DELETE FROM zgs_category.

  DATA lt_category TYPE TABLE OF zgs_category.
  DATA ls_category TYPE zgs_category.

  ls_category-client = sy-mandt.

  ls_category-category_id = 'CAT001'.
  ls_category-category_name = 'Dairy Products'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT002'.
  ls_category-category_name = 'Fruits'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT003'.
  ls_category-category_name = 'Vegetables'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT004'.
  ls_category-category_name = 'Bakery'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT005'.
  ls_category-category_name = 'Beverages'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT006'.
  ls_category-category_name = 'Snacks'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT007'.
  ls_category-category_name = 'Frozen Foods'.
  APPEND ls_category TO lt_category.

  CLEAR ls_category.
  ls_category-client = sy-mandt.
  ls_category-category_id = 'CAT008'.
  ls_category-category_name = 'Household Items'.
  APPEND ls_category TO lt_category.

  INSERT zgs_category FROM TABLE @lt_category.

  out->write( 'Categories Loaded Successfully' ).

ENDMETHOD.

ENDCLASS.
