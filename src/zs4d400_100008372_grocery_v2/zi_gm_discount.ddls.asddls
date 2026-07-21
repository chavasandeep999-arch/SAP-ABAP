@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Discount Interface View'

define view entity ZI_GM_DISCOUNT
  as select from zgm_discount

    association [1..1] to ZI_GM_PRODUCT as _Product
      on $projection.product_id = _Product.product_id

{
  key discount_id,

      product_id,

      discount_percent,

      start_date,

      end_date,

      status,

      _Product
}
