CLASS LHC_ZR_GSPRODUCT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    CONSTANTS Invalid_BasePrice TYPE symsgno VALUE '002'.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrGsproduct
        RESULT result,
      setDefaultCurrency FOR DETERMINE ON MODIFY
            IMPORTING keys FOR ZrGsproduct~setDefaultCurrency.


          METHODS validateBasePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateBasePrice.

          METHODS validateCategory FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateCategory.

          METHODS validateCurrency FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateCurrency.

          METHODS validateProductName FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateProductName.

          METHODS validateStore FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateStore.
          METHODS validateDuplicateProduct FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrGsproduct~validateDuplicateProduct.





ENDCLASS.

CLASS LHC_ZR_GSPRODUCT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD setDefaultCurrency.


  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( Currency )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  MODIFY ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    UPDATE FIELDS ( Currency )
    WITH VALUE #(
      FOR product IN products
      WHERE ( Currency IS INITIAL )
      (
        %tky     = product-%tky
        Currency = 'EUR'
      )
    ).

ENDMETHOD.

  METHOD validateBasePrice.

  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( BasePrice )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-BasePrice <= 0.

      DATA failed_record LIKE LINE OF failed-zrgsproduct.
      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zrgsproduct.

      DATA reported_record LIKE LINE OF reported-zrgsproduct.
      reported_record-%tky = product-%tky.
      reported_record-%element-BasePrice = if_abap_behv=>mk-on.

      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = Invalid_BasePrice
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zrgsproduct.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

  METHOD validateCategory.

  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( CategoryID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-CategoryID IS INITIAL.

      DATA failed_record LIKE LINE OF failed-zrgsproduct.
      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zrgsproduct.

      DATA reported_record LIKE LINE OF reported-zrgsproduct.
      reported_record-%tky = product-%tky.
      reported_record-%element-CategoryID = if_abap_behv=>mk-on.

      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '004'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zrgsproduct.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

METHOD validateCurrency.

  DATA failed_record   LIKE LINE OF failed-zrgsproduct.
  DATA reported_record LIKE LINE OF reported-zrgsproduct.

  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( Currency )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    "Currency is mandatory
    IF product-Currency IS INITIAL.

      CLEAR failed_record.
      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zrgsproduct.

      CLEAR reported_record.
      reported_record-%tky = product-%tky.
      reported_record-%element-Currency = if_abap_behv=>mk-on.
      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '005'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zrgsproduct.

      CONTINUE.

    ENDIF.

        "Check whether the currency exists
    SELECT SINGLE Currency
      FROM I_Currency
      WHERE Currency = @product-Currency
      INTO @DATA(lv_currency).

    IF sy-subrc <> 0.

      CLEAR failed_record.
      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zrgsproduct.

      CLEAR reported_record.
      reported_record-%tky = product-%tky.
      reported_record-%element-Currency = if_abap_behv=>mk-on.

      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '006'
        severity = if_abap_behv_message=>severity-error
        v1       = product-Currency ).

      APPEND reported_record TO reported-zrgsproduct.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

 METHOD validateProductName.

  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( ProductName )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-ProductName IS INITIAL.
        DATA failed_record LIKE LINE OF failed-zrgsproduct.
    failed_record-%tky = product-%tky.
    APPEND failed_record TO failed-zrgsproduct.
    DATA reported_record LIKE LINE OF reported-zrgsproduct.
    reported_record-%tky = product-%tky.
    reported_record-%element-ProductName = if_abap_behv=>mk-on.
    reported_record-%msg = new_message(
  id       = 'ZGS_MSG'
  number   = '001'
  severity = if_abap_behv_message=>severity-error
).
    APPEND reported_record TO reported-zrgsproduct.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


  METHOD validateStore.

  READ ENTITIES OF ZR_GSPRODUCT IN LOCAL MODE
    ENTITY ZrGsproduct
    FIELDS ( StoreID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(products).

  LOOP AT products INTO DATA(product).

    IF product-StoreID IS INITIAL.

      DATA failed_record LIKE LINE OF failed-zrgsproduct.
      failed_record-%tky = product-%tky.
      APPEND failed_record TO failed-zrgsproduct.

      DATA reported_record LIKE LINE OF reported-zrgsproduct.
      reported_record-%tky = product-%tky.
      reported_record-%element-StoreID = if_abap_behv=>mk-on.

      reported_record-%msg = new_message(
        id       = 'ZGS_MSG'
        number   = '003'
        severity = if_abap_behv_message=>severity-error ).

      APPEND reported_record TO reported-zrgsproduct.

    ENDIF.

  ENDLOOP.

ENDMETHOD.




  METHOD validateDuplicateProduct.
  ENDMETHOD.




ENDCLASS.
