@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Discount Interface View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_GS_DISCOUNT
  as select from zgs_discount

  association [0..1] to ZI_GS_PRODUCT as _Product
    on $projection.product_id = _Product.product_id

{
  key discount_id,

      product_id,

      discount_percent,

      start_date,

      end_date,

      final_price,

      currency,

      status,

      _Product

}
