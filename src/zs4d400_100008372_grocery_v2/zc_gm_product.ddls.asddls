@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Product Projection View'

define root view entity ZC_GM_PRODUCT
  as projection on ZI_GM_PRODUCT
{
  key product_id,

  product_name,
  store_id,
  category_id,
  base_price,
  status,

  _Store,
  _Category,
  _Discount
}
