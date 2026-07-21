@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Offer Interface View'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_GS_OFFER
  as select from zgs_offer

  association [0..1] to ZI_GS_PRODUCT as _Product
    on $projection.product_id = _Product.product_id

{

  key offer_id,

      product_id,

      offer_name,

      discount_percent,

      offer_price,

      currency,

      valid_from,

      valid_to,

      status,

      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed,

      _Product

}
