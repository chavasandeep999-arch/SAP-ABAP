@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Interface View'

define root view entity ZI_GROC_PRODUCT
  as select from zgroc_product

  association [1..1] to ZI_GROC_STORE    as _Store
    on $projection.store_id = _Store.store_id

  association [1..1] to ZI_GROC_CATEGORY as _Category
    on $projection.category_id = _Category.category_id

  association [0..*] to ZI_GROC_DISCOUNT as _Discount
    on $projection.product_id = _Discount.product_id

{
    key product_id,

        product_name,

        store_id,

        category_id,

        base_price,

        _Store,

        _Category,

        _Discount

}
