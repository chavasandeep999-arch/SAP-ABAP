@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Projection View'

define root view entity ZC_GS_PRODUCT
  as projection on ZI_GS_PRODUCT
{
  key product_id,

      product_name,

      store_id,

      category_id,

      base_price,

      currency,
      

      _Store,

      _Category
}
