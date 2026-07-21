CLASS lhc_ZI_GS_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_gs_product RESULT result.

    METHODS setDefaultCurrency FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_gs_product~setDefaultCurrency.



    METHODS validateBasePrice FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gs_product~validateBasePrice.

    METHODS validateCategory FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gs_product~validateCategory.

    METHODS validateCurrency FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gs_product~validateCurrency.

    METHODS validateProductName FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gs_product~validateProductName.

    METHODS validateStore FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_gs_product~validateStore.

ENDCLASS.

CLASS lhc_ZI_GS_PRODUCT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

METHOD setDefaultCurrency.

  READ ENTITIES OF zi_gs_product IN LOCAL MODE
    ENTITY zi_gs_product
    FIELDS ( currency )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  MODIFY ENTITIES OF zi_gs_product IN LOCAL MODE
    ENTITY zi_gs_product
    UPDATE FIELDS ( currency )
    WITH VALUE #(
      FOR product IN products
      WHERE ( currency IS INITIAL )
      (
        %tky     = product-%tky
        currency = 'EUR'
      )
    ).

ENDMETHOD.


  METHOD validateBasePrice.

  DATA failed_record   LIKE LINE OF failed-zi_gs_product.
  DATA reported_record LIKE LINE OF reported-zi_gs_product.

  READ ENTITIES OF ZI_GS_PRODUCT IN LOCAL MODE
    ENTITY ZI_GS_PRODUCT
    FIELDS ( base_price )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-base_price <= 0.

      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zi_gs_product.

      reported_record-%tky = product-%tky.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '002'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zi_gs_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateCategory.

  DATA failed_record   LIKE LINE OF failed-zi_gs_product.
  DATA reported_record LIKE LINE OF reported-zi_gs_product.

  READ ENTITIES OF ZI_GS_PRODUCT IN LOCAL MODE
    ENTITY ZI_GS_PRODUCT
    FIELDS ( category_id )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-category_id IS INITIAL.

      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zi_gs_product.

      reported_record-%tky = product-%tky.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '004'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zi_gs_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateCurrency.

  DATA failed_record   LIKE LINE OF failed-zi_gs_product.
  DATA reported_record LIKE LINE OF reported-zi_gs_product.

  READ ENTITIES OF ZI_GS_PRODUCT IN LOCAL MODE
    ENTITY ZI_GS_PRODUCT
    FIELDS ( currency )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-currency IS INITIAL.

      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zi_gs_product.

      reported_record-%tky = product-%tky.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '005'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zi_gs_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateProductName.

  DATA failed_record   LIKE LINE OF failed-zi_gs_product.
  DATA reported_record LIKE LINE OF reported-zi_gs_product.

  READ ENTITIES OF ZI_GS_PRODUCT IN LOCAL MODE
    ENTITY ZI_GS_PRODUCT
    FIELDS ( product_name )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-product_name IS INITIAL.

      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zi_gs_product.

      reported_record-%tky = product-%tky.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '001'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zi_gs_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.
  METHOD validateStore.

  DATA failed_record   LIKE LINE OF failed-zi_gs_product.
  DATA reported_record LIKE LINE OF reported-zi_gs_product.

  READ ENTITIES OF ZI_GS_PRODUCT IN LOCAL MODE
    ENTITY ZI_GS_PRODUCT
    FIELDS ( store_id )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-store_id IS INITIAL.

      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zi_gs_product.

      reported_record-%tky = product-%tky.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '003'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zi_gs_product.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

ENDCLASS.
