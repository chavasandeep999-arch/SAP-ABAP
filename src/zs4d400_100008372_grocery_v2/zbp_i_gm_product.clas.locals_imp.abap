CLASS lhc_ZI_GM_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

   METHODS get_global_authorizations
      FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations
      FOR zi_gm_product
      RESULT result.

    METHODS validateProductName
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gm_product~validateProductName.

    METHODS validateBasePrice
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gm_product~validateBasePrice.

    METHODS validateStore
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gm_product~validateStore.

    METHODS validateCategory
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gm_product~validateCategory.

    METHODS validateProductLength
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gm_product~validateProductLength.

    METHODS determineStatus
      FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_gm_product~determineStatus.

ENDCLASS.
CLASS lhc_ZI_GM_PRODUCT IMPLEMENTATION.

  METHOD get_global_authorizations.

  result-%create = if_abap_behv=>auth-allowed.
  result-%update = if_abap_behv=>auth-allowed.
  result-%delete = if_abap_behv=>auth-allowed.

ENDMETHOD.

  METHOD validateProductName.

  READ ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    FIELDS ( product_name )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-product_name IS INITIAL.

      APPEND VALUE #(
          %tky = product-%tky
      ) TO failed-zi_gm_product.

      APPEND VALUE #(
          %tky = product-%tky
          %msg = new_message_with_text(
                    severity = if_abap_behv_message=>severity-error
                    text     = 'Product Name cannot be empty'
                 )
      ) TO reported-zi_gm_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateBasePrice.

  READ ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    FIELDS ( base_price )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-base_price <= 0.

      APPEND VALUE #(
          %tky = product-%tky
      ) TO failed-zi_gm_product.

      APPEND VALUE #(
          %tky = product-%tky
          %msg = new_message_with_text(
                    severity = if_abap_behv_message=>severity-error
                    text     = 'Base Price must be greater than zero'
                 )
      ) TO reported-zi_gm_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.



 METHOD validateStore.

  READ ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    FIELDS ( store_id )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-store_id IS INITIAL.

      APPEND VALUE #(
        %tky = product-%tky
      ) TO failed-zi_gm_product.

      APPEND VALUE #(
        %tky = product-%tky
        %msg = new_message_with_text(
                  severity = if_abap_behv_message=>severity-error
                  text = 'Store is mandatory'
               )
      ) TO reported-zi_gm_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


 METHOD validateCategory.

  READ ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    FIELDS ( category_id )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-category_id IS INITIAL.

      APPEND VALUE #(
        %tky = product-%tky
      ) TO failed-zi_gm_product.

      APPEND VALUE #(
        %tky = product-%tky
        %msg = new_message_with_text(
                  severity = if_abap_behv_message=>severity-error
                  text = 'Category is mandatory'
               )
      ) TO reported-zi_gm_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateProductLength.

  READ ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    FIELDS ( product_name )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF strlen( product-product_name ) < 3.

      APPEND VALUE #(
        %tky = product-%tky
      ) TO failed-zi_gm_product.

      APPEND VALUE #(
        %tky = product-%tky
        %msg = new_message_with_text(
                  severity = if_abap_behv_message=>severity-error
                  text = 'Product name must contain at least 3 characters'
               )
      ) TO reported-zi_gm_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

 METHOD determineStatus.

  MODIFY ENTITIES OF zi_gm_product IN LOCAL MODE
    ENTITY zi_gm_product
    UPDATE FIELDS ( status )
    WITH VALUE #(
      FOR key IN keys
      (
        %tky   = key-%tky
        status = 'AVAILABLE'
      )
    ).

ENDMETHOD.


ENDCLASS.
