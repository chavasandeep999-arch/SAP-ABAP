@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Store Value Help'

define view entity ZI_GS_STORE_VH
  as select from zgs_store
{
  key store_id,
      store_name
}
