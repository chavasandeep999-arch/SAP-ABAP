CLASS zcl_gs_load_product_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_gs_load_product_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_product TYPE TABLE OF zgs_product.
    DATA ls_product TYPE zgs_product.

    DELETE FROM zgs_product.

*-----------------------------------------------------------------------
* Dairy Products
*-----------------------------------------------------------------------

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P001'.
    ls_product-product_name = 'Milk'.
    ls_product-store_id = 'ST001'.
    ls_product-category_id = 'CAT001'.
    ls_product-base_price = '1.29'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P002'.
    ls_product-product_name = 'Butter'.
    ls_product-store_id = 'ST002'.
    ls_product-category_id = 'CAT001'.
    ls_product-base_price = '2.19'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P003'.
    ls_product-product_name = 'Cheese'.
    ls_product-store_id = 'ST003'.
    ls_product-category_id = 'CAT001'.
    ls_product-base_price = '3.49'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P004'.
    ls_product-product_name = 'Yogurt'.
    ls_product-store_id = 'ST004'.
    ls_product-category_id = 'CAT001'.
    ls_product-base_price = '0.99'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P005'.
    ls_product-product_name = 'Cream'.
    ls_product-store_id = 'ST005'.
    ls_product-category_id = 'CAT001'.
    ls_product-base_price = '1.79'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

*-----------------------------------------------------------------------
* Fruits
*-----------------------------------------------------------------------

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P006'.
    ls_product-product_name = 'Apple'.
    ls_product-store_id = 'ST001'.
    ls_product-category_id = 'CAT002'.
    ls_product-base_price = '2.49'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P007'.
    ls_product-product_name = 'Banana'.
    ls_product-store_id = 'ST002'.
    ls_product-category_id = 'CAT002'.
    ls_product-base_price = '1.59'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P008'.
    ls_product-product_name = 'Orange'.
    ls_product-store_id = 'ST003'.
    ls_product-category_id = 'CAT002'.
    ls_product-base_price = '2.99'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P009'.
    ls_product-product_name = 'Grapes'.
    ls_product-store_id = 'ST004'.
    ls_product-category_id = 'CAT002'.
    ls_product-base_price = '3.29'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    CLEAR ls_product.
    ls_product-client = sy-mandt.
    ls_product-product_id = 'P010'.
    ls_product-product_name = 'Mango'.
    ls_product-store_id = 'ST005'.
    ls_product-category_id = 'CAT002'.
    ls_product-base_price = '2.89'.
    ls_product-currency = 'EUR'.
    APPEND ls_product TO lt_product.

    INSERT zgs_product FROM TABLE @lt_product.

    COMMIT WORK.

    out->write( '=====================================' ).
    out->write( 'Product Demo Data Loaded Successfully' ).
    out->write( 'Total Products Loaded: 10' ).
    out->write( '=====================================' ).

  ENDMETHOD.

ENDCLASS.
