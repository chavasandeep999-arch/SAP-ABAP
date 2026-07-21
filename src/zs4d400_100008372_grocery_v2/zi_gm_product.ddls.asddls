@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Interface View'

@Metadata.allowExtensions: true
define root view entity ZI_GM_PRODUCT
  as select from zgm_product

    association [1..1] to ZI_GM_STORE as _Store
      on $projection.store_id = _Store.store_id

    association [1..1] to ZI_GM_CATEGORY as _Category
      on $projection.category_id = _Category.category_id

    association [0..*] to ZI_GM_DISCOUNT as _Discount
      on $projection.product_id = _Discount.product_id

{
  key product_id,

      product_name,

     @Consumption.valueHelpDefinition: [
{
    entity: {
        name: 'ZI_GM_STORE_VH',
        element: 'store_id'
    }
}
]
store_id,

@Consumption.valueHelpDefinition: [
{
    entity: {
        name: 'ZI_GM_CATEGORY_VH',
        element: 'category_id'
    }
}
]
category_id,

      base_price,

      status,

      _Store,
      _Category,
      _Discount

}
