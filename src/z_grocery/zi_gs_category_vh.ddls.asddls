@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category Value Help'

define view entity ZI_GS_CATEGORY_VH
  as select from zgs_category
{
  key category_id,
      category_name
}
