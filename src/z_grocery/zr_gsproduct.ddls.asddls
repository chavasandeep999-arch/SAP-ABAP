@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZGSPRODUCT'
@EndUserText.label: '###GENERATED Core Data Service Entity'

define root view entity ZR_GSPRODUCT
  as select from zgs_product
{
  key product_id as ProductID,

      product_name as ProductName,

      @Consumption.valueHelpDefinition: [
        {
          entity: {
            name    : 'ZI_GS_STORE_VH',
            element : 'store_id'
          }
        }
      ]
      store_id as StoreID,

      @Consumption.valueHelpDefinition: [
        {
          entity: {
            name    : 'ZI_GS_CATEGORY_VH',
            element : 'category_id'
          }
        }
      ]
      category_id as CategoryID,

      base_price as BasePrice,
      

      @Consumption.valueHelpDefinition: [
        {
          entity: {
            name    : 'I_CurrencyStdVH',
            element : 'Currency'
          }
        }
      ]
      currency as Currency,
      price_category as PriceCategory,
      

      @Semantics.user.createdBy: true
      created_by as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      created_at as CreatedAt,

      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed as LocalLastChanged
}
