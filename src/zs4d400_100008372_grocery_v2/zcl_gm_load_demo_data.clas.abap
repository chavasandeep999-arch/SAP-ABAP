CLASS zcl_gm_load_demo_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_gm_load_demo_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*--------------------------------------------------------------------
* Delete Existing Data
*--------------------------------------------------------------------

    DELETE FROM zgm_discount.
    DELETE FROM zgm_product.
    DELETE FROM zgm_category.
    DELETE FROM zgm_store.

*--------------------------------------------------------------------
* Internal Tables
*--------------------------------------------------------------------

    DATA:
      lt_store    TYPE TABLE OF zgm_store,
      lt_category TYPE TABLE OF zgm_category,
      lt_product  TYPE TABLE OF zgm_product,
      lt_discount TYPE TABLE OF zgm_discount.

*--------------------------------------------------------------------
* Stores
*--------------------------------------------------------------------

    lt_store = VALUE #( (

      client     = sy-mandt
      store_id   = 'ST001'
      store_name = 'Aldi'
      city       = 'Munich'
      country    = 'Germany'

    ) (

      client     = sy-mandt
      store_id   = 'ST002'
      store_name = 'Lidl'
      city       = 'Munich'
      country    = 'Germany'

    ) (

      client     = sy-mandt
      store_id   = 'ST003'
      store_name = 'Kaufland'
      city       = 'Munich'
      country    = 'Germany'

    ) ).

    INSERT zgm_store FROM TABLE @lt_store.

*--------------------------------------------------------------------
* Categories
*--------------------------------------------------------------------

    lt_category = VALUE #( (

      client        = sy-mandt
      category_id   = 'CAT001'
      category_name = 'Vegetables'

    ) (

      client        = sy-mandt
      category_id   = 'CAT002'
      category_name = 'Fruits'

    ) (

      client        = sy-mandt
      category_id   = 'CAT003'
      category_name = 'Dairy'

    ) ).

    INSERT zgm_category FROM TABLE @lt_category.

*--------------------------------------------------------------------
* Products
*--------------------------------------------------------------------

    lt_product = VALUE #( (

      client       = sy-mandt
      product_id   = 'PR001'
      product_name = 'Tomato'
      store_id     = 'ST001'
      category_id  = 'CAT001'
      base_price   = '2.50'
      status       = 'AVAILABLE'

    ) (

      client       = sy-mandt
      product_id   = 'PR002'
      product_name = 'Milk'
      store_id     = 'ST002'
      category_id  = 'CAT003'
      base_price   = '1.80'
      status       = 'AVAILABLE'

    ) (

      client       = sy-mandt
      product_id   = 'PR003'
      product_name = 'Apple'
      store_id     = 'ST003'
      category_id  = 'CAT002'
      base_price   = '3.10'
      status       = 'AVAILABLE'

    ) ).

    INSERT zgm_product FROM TABLE @lt_product.

*--------------------------------------------------------------------
* Discounts
*--------------------------------------------------------------------

    lt_discount = VALUE #( (

      client            = sy-mandt
      discount_id       = 'DIS001'
      product_id        = 'PR001'
      discount_percent  = '10'
      start_date        = sy-datum
      end_date          = sy-datum + 10
      status            = 'ACTIVE'

    ) (

      client            = sy-mandt
      discount_id       = 'DIS002'
      product_id        = 'PR002'
      discount_percent  = '15'
      start_date        = sy-datum
      end_date          = sy-datum + 7
      status            = 'ACTIVE'

    ) ).

    INSERT zgm_discount FROM TABLE @lt_discount.

*--------------------------------------------------------------------
* Commit
*--------------------------------------------------------------------

    COMMIT WORK.

    out->write( 'Demo Data Loaded Successfully.' ).

  ENDMETHOD.

ENDCLASS.
