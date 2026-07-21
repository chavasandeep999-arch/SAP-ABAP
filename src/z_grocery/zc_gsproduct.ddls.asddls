@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZGSPRODUCT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_GSPRODUCT
  provider contract transactional_query
  as projection on ZR_GSPRODUCT
  association [1..1] to ZR_GSPRODUCT as _BaseEntity on $projection.ProductID = _BaseEntity.ProductID
{
  key ProductID,
    ProductName,

  @Consumption.valueHelpDefinition: [
    {
      entity: {
        name    : 'ZI_GS_STORE_VH',
        element : 'store_id'
      }
    }
  ]
  StoreID,

  @Consumption.valueHelpDefinition: [
    {
      entity: {
        name    : 'ZI_GS_CATEGORY_VH',
        element : 'category_id'
      }
    }
  ]
  CategoryID,

  BasePrice,

  @Consumption.valueHelpDefinition: [
    {
      entity: {
        name    : 'I_CurrencyStdVH',
        element : 'Currency'
      }
    }
  ]
  
  Currency,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.lastChangedBy: true
  }
  PriceCategory,
  LastChangedBy,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChanged,
  _BaseEntity
}
