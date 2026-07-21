@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Interface View'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_GS_PRODUCT
  as select from zgs_product

  association [0..1] to ZI_GS_STORE    as _Store
    on $projection.store_id = _Store.store_id

  association [0..1] to ZI_GS_CATEGORY as _Category
    on $projection.category_id = _Category.category_id

{
  key product_id,

      product_name,

      store_id,

      category_id,

      base_price,

      currency,
      price_category,
      
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed,

      _Store,
      _Category
}
